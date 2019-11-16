import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'imageDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(document['imageURL']),
        radius: 30,
      ),
      title: Text(document['name']),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.calendar_today, size: 15, color: Colors.grey,),
          Text(document['date']),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageDetail(document: document)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.home),
            onPressed: () {},
          );
        }),
        title: Text("Home"),
      ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('pictures').orderBy('name').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Padding(
                padding: EdgeInsets.only(left: 170, top: 200),
                child: CircularProgressIndicator(),
              );
              return ListView.builder(
                itemExtent: 80,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]),
              );
            }
        ),//
    );
  }
}