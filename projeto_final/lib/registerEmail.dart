import 'package:flutter/material.dart';
import 'package:projeto_final/home.dart';
import 'package:projeto_final/removeEmail.dart';

class RegisterEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen())
                    );
                  },
                );
              }),
          title: Text("Register e-mail"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container (
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your name',
                        contentPadding: EdgeInsets.all(10),
                    ),
                  )
                ),
                Container (
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter your e-mail',
                          contentPadding: EdgeInsets.all(10),
                      ),
                    )
                ),
                Container (
                    margin: EdgeInsets.only(bottom: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter your phone number',
                          contentPadding: EdgeInsets.all(10),
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FlatButton(
                    color: Colors.cyan,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 17),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}