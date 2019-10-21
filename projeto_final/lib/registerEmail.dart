import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatelessWidget {

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController numberController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Register e-mail"),        
      ),
      body: Padding(
        padding: EdgeInsets.all(20),        
        child: ListView(
          children: <Widget>[
            Padding (
              padding	: EdgeInsets.only(bottom: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Enter your name',
                    contentPadding: EdgeInsets.all(10),
                ),
              )
            ),
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Enter your e-mail',
                      contentPadding: EdgeInsets.all(10),
                  ),
                )
            ),
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                      labelText: 'Enter your phone number',
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
                  if (nameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      numberController.text.isNotEmpty) {
                    Firestore.instance.collection('emails').document().setData( {
                      'name': nameController.text,
                      'email': emailController.text,
                      'number': numberController.text
                    });
                  }
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(numberController.text),
                      );
                    },
                  );
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
    );
  }
}