import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class SelectDevice extends StatefulWidget {  
  @override
  SelectDeviceState createState() => SelectDeviceState();  
}

class SelectDeviceState extends State<SelectDevice> {
  bool searchDevices = false; 
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice device;
  bool connected = false;
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    bluetoothConnectionState();
  }

  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];
    // To get the list of paired devices
    try {
      devices = await bluetooth.getBondedDevices();
    } on Exception {
      print("Error");
  }

  bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case FlutterBluetoothSerial.CONNECTED:
          setState(() {
            connected = true;
            pressed = false;
          });
          break;
        case FlutterBluetoothSerial.DISCONNECTED:
          setState(() {
            connected = false;
            pressed = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      devicesList = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Select Device"),        
      ),
      body: Padding(
        padding: EdgeInsets.all(20),        
        child: ListView(
          children: <Widget>[            
            SwitchListTile(              
              title: Text('Search for devices'),
              value: searchDevices,
              secondary: Icon(Icons.bluetooth_searching),
              onChanged: (bool value){ 
                setState(() {
                  searchDevices = value;
                });
              },             
            ),
            ListView.builder(                  
              itemCount: devicesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),                  
                  title: Text('Device ' + (index + 1).toString()),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.bluetooth, size: 15, color: Colors.grey,),                                      
                      Text(
                        devicesList[index].name
                      )
                    ],
                  ),   
                  onTap: () {
                    Navigator.push(
                      context,
                      null
                    );
                  },
                );          
              }        
            ),                  
          ],
        ),        
      ),
    );
  }  
}