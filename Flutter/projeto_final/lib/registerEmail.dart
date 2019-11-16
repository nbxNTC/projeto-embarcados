import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterEmail extends StatefulWidget {
  @override
  RegisterEmailState createState() => RegisterEmailState();
}

class RegisterEmailState extends State<RegisterEmail> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();

  String nameBuffer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    super.dispose();
  }

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
                autofocus: true,
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Enter your name',
                    contentPadding: EdgeInsets.all(10),
                ),
                onSubmitted: (text) {
                  nameController.text = text;
                },
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
                  onSubmitted: (text) {
                    emailController.text = text;
                  },
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
                  onSubmitted: (text) {
                    numberController.text = text;
                  },
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: CupertinoButton(
                color: Colors.cyan,
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
                    nameBuffer = nameController.text;
                    nameController.text = '';
                    numberController.text = '';
                    emailController.text = '';

                    return showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Notification"),
                          content: Text("Thanks for register your e-mail, " + nameBuffer + "."),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Close'),
                              onPressed:() {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  }
                  else {
                    nameController.text = '';
                    numberController.text = '';
                    emailController.text = '';
                    return showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Warning"),
                          content: Text("Sorry, try again."),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Close'),
                              onPressed:() {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                  }
                     //
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              )
            )
          ],
        ),        
      ),
    );
  }
}