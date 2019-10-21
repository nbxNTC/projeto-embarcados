import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'imageDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Gallery extends StatelessWidget {

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
//      title: Row(
//        children: [
//          Expanded(
//            child: Text(document['name']),
//          ),
//          Container(
//            decoration: BoxDecoration(
//              color: Colors.cyan,
//            ),
//            padding: EdgeInsets.all(10),
//            child: Text(
//              document['date'].toString(),
//            ),
//          )
//        ],
//      ),
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.image),
            onPressed: () {},
          );
        }),
        title: Text("Gallery"),
      ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('pictures').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Loading...');
            return ListView.builder(
              itemExtent: 80,
              itemCount: 2,
              itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
            );
          }
        ),
//      body: ListView.builder(
//        itemCount: imageList.length,
//        itemBuilder: (context, index) {
//          return ListTile(
//            contentPadding: EdgeInsets.all(10),
//            leading: CircleAvatar(
//              backgroundImage: AssetImage(imageList[index].imagePath),
//              radius: 30,
//            ),
//            title: Text('Picture ' + (index + 1).toString()),
//            subtitle: Row(
//              children: <Widget>[
//                Icon(Icons.calendar_today, size: 15, color: Colors.grey,),
//                Text(
//                  '  ' +
//                  imageList[index].imageTime.day.toString() + '-' +
//                  imageList[index].imageTime.month.toString() + '-' +
//                  imageList[index].imageTime.year.toString() + '   '
//                ),
//                Icon(Icons.access_time, size: 15, color: Colors.grey,),
//                Text(
//                  '  ' +
//                  imageList[index].imageTime.hour.toString() + 'hrs' +
//                  imageList[index].imageTime.minute.toString() + 'min'
//                )
//              ],
//            ),
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ImageDetail(imageData: imageList[index],)),
//              );
//            },
//          );
//        }
    );
  }
}

//class ImageData {
//
//  String key;
//  String name;
//  String date;
//
//  ImageData(this.name, this.date);
//
//  ImageData.fromSnapshot(DataSnapshot snapshot)
//    : key = snapshot.key,
//      name = snapshot.value['name'],
//      date = snapshot.value['date'];
//
//  toJson() {
//    return {
//      "name": name,
//      "date": date,
//    };
//  }
//
//}
