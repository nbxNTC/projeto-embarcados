import 'package:flutter/material.dart';
import 'imageData.dart';

class ImageDetail extends StatelessWidget {
  
  final ImageData imageData;

  ImageDetail({this.imageData});
  
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
            Image.asset(imageData.imagePath, fit: BoxFit.fill,), 
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
              title: Text(                 
                imageData.imageTime.day.toString() + '-' +
                imageData.imageTime.month.toString() + '-' +
                imageData.imageTime.year.toString()
              ),
              subtitle: Text(                
                imageData.imageTime.hour.toString() + 'hrs' +
                imageData.imageTime.minute.toString() + 'min',                  
              ),  
            ),
            ListTile(              
              contentPadding: EdgeInsets.only(top: 10, left: 25),
              leading: Icon(Icons.image, size: 40,),
              title: Text(                 
                imageData.imagePath
              ),               
            )      
          ]         
        )          
      ),
    );
  }
}