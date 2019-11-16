import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SelectDevice extends StatefulWidget {  
  @override
  SelectDeviceState createState() => SelectDeviceState();  
}

class SelectDeviceState extends State<SelectDevice> {
  
  bool searchDevices = false;     
  
  final FirebaseMessaging messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    messaging.getToken().then((token) {
      print(token);
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
                          
          ],
        ),        
      ),
    );
  }  
}

// ListView.builder(                  
            //   itemCount: devicesList.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       contentPadding: EdgeInsets.all(10),                  
            //       title: Text('Device ' + (index + 1).toString()),
            //       subtitle: Row(
            //         children: <Widget>[
            //           Icon(Icons.bluetooth, size: 15, color: Colors.grey,),                                      
            //           Text(
            //             devicesList[index].name
            //           )
            //         ],
            //       ),   
            //       onTap: () {
            //         Navigator.push(
            //           context,
            //           null
            //         );
            //       },
            //     );          
            //   }        
            // ),    