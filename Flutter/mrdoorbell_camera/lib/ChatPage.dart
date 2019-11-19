import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:path/path.dart';
import 'package:path/path.dart' as prefix1;
import 'package:path_provider/path_provider.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice server;
  final CameraDescription camera;

  const ChatPage({Key key, this.server, this.camera}) : super(key: key);

  @override
  _ChatPage createState() => new _ChatPage();
}

class _Message {
  int whom;
  String text;

  _Message(this.whom, this.text);
}

class _ChatPage extends State<ChatPage> {
  static final clientID = 0;
  static final maxMessageLength = 4096 - 3;
  int picturesCount = 0;
  BluetoothConnection connection;

  List<_Message> messages = List<_Message>();
  String _messageBuffer = '';

  final TextEditingController textEditingController = new TextEditingController();
  final ScrollController listScrollController = new ScrollController();

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

    BluetoothConnection.toAddress(widget.server.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection.input.listen(_onDataReceived).onDone(() {
        // Example: Detect which side closed the connection
        // There should be `isDisconnecting` flag to show are we are (locally)
        // in middle of disconnecting process, should be set before calling
        // `dispose`, `finish` or `close`, which all causes to disconnect.
        // If we except the disconnection, `onDone` should be fired as result.
        // If we didn't except this (no flag set), it means closing by remote.
        if (isDisconnecting) {
          print('Disconnecting locally!');
        }
        else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();

    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }

    super.dispose();
  }

  void takePicture(bool isReady, String fileNameOutside) async{
    if (isReady) {
      String fileNameStore = fileNameOutside[0] + '.png';
      try {
        // Ensure that the camera is initialized.
        await _initializeControllerFuture;

        // Construct the path where the image should be saved using the
        // pattern package.
        final path = join(
          // Store the picture in the temp directory.
          // Find the temp directory using the `path_provider` plugin.
          (await getTemporaryDirectory()).path,
//          '${DateTime.now()}.png',
          fileNameStore,
        );

        // Attempt to take a picture and log where it's been saved.
        await _controller.takePicture(path);

        // If the picture was taken, display it on a new screen.        
        String fileName = basename(path);
        print("teste" + fileName);
        StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child("pictures/" + fileName);
        StorageUploadTask uploadTask = firebaseStorageRef.putFile(File(path));


      } catch (e) {
        // If an error occurs, log the error to the console.
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Row> list = messages.map((_message) {
      return Row(
        children: <Widget>[
          Container(
            child: Text((text) {
              return text == '/shrug' ? '¯\\_(ツ)_/¯' : text;
            } (_message.text.trim()), style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            width: 222.0,
            decoration: BoxDecoration(color: _message.whom == clientID ? Colors.blueAccent : Colors.grey, borderRadius: BorderRadius.circular(7.0)),
          ),
        ],
        mainAxisAlignment: _message.whom == clientID ? MainAxisAlignment.end : MainAxisAlignment.start,
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.cyan,
            iconTheme: IconThemeData(color: Colors.white),
            title: (
                isConnecting ? Text('Connecting to ' + widget.server.name + '...') :
                isConnected ? Text('Connected with ' + widget.server.name) :
                Text('Disconnected')
            )
        ),
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Center(
//                    child: CircularProgressIndicator(),
//                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Icon(Icons.camera_alt, size: 200, color: Colors.cyan),
                        SizedBox(height: 100),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),

//                  Flexible(
//                      child: ListView(
//                          padding: const EdgeInsets.all(12.0),
//                          controller: listScrollController,
//                          children: list
//                      )
//                  ),
//                  Row(
//                      children: <Widget>[
//                        Flexible(
//                            child: Container(
//                                margin: const EdgeInsets.only(left: 16.0),
//                                child: TextField(
//                                  style: const TextStyle(fontSize: 15.0),
//                                  controller: textEditingController,
//                                  decoration: InputDecoration.collapsed(
//                                    hintText: (
//                                        isConnecting ? 'Wait until connected...' :
//                                        isConnected ? 'Type your message...' :
//                                        'Chat got disconnected'
//                                    ),
//                                    hintStyle: const TextStyle(color: Colors.grey),
//                                  ),
//                                  enabled: isConnected,
//                                )
//                            )
//                        ),
//                        Container(
//                          margin: const EdgeInsets.all(8.0),
//                          child: IconButton(
//                              icon: const Icon(Icons.send),
//                              onPressed: isConnected ? () => _sendMessage(textEditingController.text) : null
//                          ),
//                        ),
//                      ]
//                  )
                ]
            )
        )
    );
  }

  void _onDataReceived(Uint8List data) async{
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      }
      else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        }
        else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    takePicture(true, dataString[0]);
    int index = buffer.indexOf(13);
    if (~index != 0) { // \r\n
      setState(() {
        messages.add(_Message(1,
            backspacesCounter > 0
                ? _messageBuffer.substring(0, _messageBuffer.length - backspacesCounter)
                : _messageBuffer
                + dataString.substring(0, index)
        ));
        _messageBuffer = dataString.substring(index);
      });
//      if (_messageBuffer == "\r\n")

    }
    else {
      _messageBuffer = (
          backspacesCounter > 0
              ? _messageBuffer.substring(0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer
              + dataString
      );
    }
  }

  void _sendMessage(String text) async {
    text = text.trim();
    textEditingController.clear();

    if (text.length > 0)  {
      try {
        connection.output.add(utf8.encode(text));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

        Future.delayed(Duration(milliseconds: 333)).then((_) {
          listScrollController.animateTo(listScrollController.position.maxScrollExtent, duration: Duration(milliseconds: 333), curve: Curves.easeOut);
        });
      }
      catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}