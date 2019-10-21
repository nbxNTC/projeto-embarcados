import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {

  final DocumentSnapshot document;

  ImageDetail({this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Details"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Image.network(document['imageURL'], fit: BoxFit.fill,),
            Container(
              margin: EdgeInsets.only(top: 27),
              padding: EdgeInsets.all(10),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 15, left: 25),
              leading: Icon(Icons.calendar_today, size: 40,),
              title: Text(document['date']),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 25),
              leading: Icon(Icons.image, size: 40,),
              title: Text(document['imageURL']),
            )
          ]
        )
      ),
    );
  }
}