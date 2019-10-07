import 'package:flutter/material.dart';

class Options extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.settings),
            onPressed: () {},
          );
        }),
        title: Text("Options"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 10),
            FlatButton(
              color: Colors.cyan,
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/registeremail');
              },
              child: Text(
                "Register e-mail",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.cyan,
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/removeemail');
              },
              child: Text(
                "Remove e-mail",
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.cyan,
              textColor: Colors.white,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/selectdevice');
              },
              child: Text(
                "Bluetooth",
                style: TextStyle(fontSize: 17),
              ),
            ),            
          ],
        ),
      ),
    );
  }
}
