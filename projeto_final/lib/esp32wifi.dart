import 'package:flutter/material.dart';

class Esp32Wifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("ESP32 Configure Wi-Fi"),        
      ),
      body: Padding(
        padding: EdgeInsets.all(20),        
        child: ListView(
          children: <Widget>[
            Padding (
              padding	: EdgeInsets.only(bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter the SSID',
                    contentPadding: EdgeInsets.all(10),
                ),
              )
            ),
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(10),
                  ),
                )
            ),            
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FlatButton(
                color: Colors.cyan,
                textColor: Colors.white,
                padding: EdgeInsets.all(15),
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Send",
                  style: TextStyle(fontSize: 17),
                ),
              )
            )
          ],
        ),        
      ),
    );
  }
}