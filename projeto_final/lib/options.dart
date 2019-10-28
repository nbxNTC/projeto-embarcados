import 'package:flutter/cupertino.dart';
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
            CupertinoButton(
              color: Colors.cyan,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/bluetooth');
              },
              child: Text(
                "Configure Arduino",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.cyan,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/registeremail');
              },
              child: Text(
                "Register E-mail",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.cyan,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.of(context).pushNamed('/removeemail');
              },
              child: Text(
                "Remove E-mail",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
