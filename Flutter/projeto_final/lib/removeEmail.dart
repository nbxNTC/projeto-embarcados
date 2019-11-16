import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoveEmail extends StatefulWidget {
  @override
  RemoveEmailState createState() => RemoveEmailState();
}

class RemoveEmailState extends State<RemoveEmail> {

  final emailController = TextEditingController();

  String emailTest;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Remove e-mail"),       
      ),
      body: Padding(
        padding: EdgeInsets.all(20),        
        child: ListView(          
          children: <Widget>[
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextField(
                  autofocus: true,
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
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: CupertinoButton(
                  color: Colors.cyan,
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      emailTest = emailController.text;
                      Firestore.instance.collection('emails').getDocuments().then((snapshot) {
                        for (DocumentSnapshot documentSnapshot in snapshot.documents){
                          if (documentSnapshot['email'] == emailTest) {
                            documentSnapshot.reference.delete();
                          }
                        }
                      });
                      emailController.text = '';
                      return showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("Notification"),
                            content: Text("Your e-mail has been removed."),
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
                  },
                  child: Text(
                    "Remove",
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