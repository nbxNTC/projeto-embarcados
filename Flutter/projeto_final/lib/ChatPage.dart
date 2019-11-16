import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter/cupertino.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice server;
  
  const ChatPage({this.server});
  
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
  BluetoothConnection connection;

  List<_Message> messages = List<_Message>();
  String _messageBuffer = '';

  final ssidController = TextEditingController();
  final passwordController = TextEditingController();

  bool isConnecting = true;
  bool get isConnected => connection != null && connection.isConnected;

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

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
    // Avoid memory leak (`setState` after dispose) and disconnect
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: (
          isConnecting ? Text('Connecting to ' + widget.server.name + '...') :
          isConnected ? Text('Connected with ' + widget.server.name) :
          Text('Device is not connected')
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Padding (
                padding	: EdgeInsets.only(bottom: 15),
                child: TextField(
                  enabled: isConnecting ? false :
                  isConnected ? true :
                  false,
                  controller: ssidController,
                  decoration: InputDecoration(
                    labelText: 'Enter SSID',
                    contentPadding: EdgeInsets.all(10),
                  ),
                  onSubmitted: (text) {
                    ssidController.text = text;
                  },
                )
            ),
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  enabled: isConnecting ? false :
                  isConnected ? true :
                  false,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    contentPadding: EdgeInsets.all(10),
                  ),
                  onSubmitted: (text) {
                    passwordController.text = text;
                  },
                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: CupertinoButton(
                  color: Colors.cyan,
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    if (ssidController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      _sendMessage('WIFI' + ssidController.text +
                                   ';;' + passwordController.text +
                                   'EFLAG');//
                    }
                    else {
                      ssidController.text = 'ZenFuturo 2.4G';
                      passwordController.text = 'zenfuturo777';
                    }
                  },
                  child: Text(
                    "Connect Wi-Fi",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                )
            )
          ],
        ),
      ),//
    );
  }

  void _onDataReceived(Uint8List data) {
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

    if (text.length > 0)  {
      try {
        connection.output.add(utf8.encode(text));
        await connection.output.allSent;

        setState(() {
          messages.add(_Message(clientID, text));
        });

      }
      catch (e) {
        // Ignore error, but notify state
        setState(() {});
      }
    }
  }
}
