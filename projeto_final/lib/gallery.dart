import 'package:flutter/material.dart';
import 'imageData.dart';
import 'imageDetail.dart';

class Gallery extends StatelessWidget {
  final List<ImageData> imageList = [
    ImageData(DateTime.now(), 'assets/1.jpg'),
    ImageData(DateTime.now(), 'assets/2.jpg'),
    ImageData(DateTime.now(), 'assets/3.jpg'),
    ImageData(DateTime.now(), 'assets/4.jpg')
  ];  
  
  
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
      body: ListView.builder(                  
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundImage: AssetImage(imageList[index].imagePath),
              radius: 30,
            ),
            title: Text('Picture ' + (index + 1).toString()),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.calendar_today, size: 15, color: Colors.grey,),                
                Text(
                  '  ' +
                  imageList[index].imageTime.day.toString() + '-' +
                  imageList[index].imageTime.month.toString() + '-' +
                  imageList[index].imageTime.year.toString() + '   '
                ),
                Icon(Icons.access_time, size: 15, color: Colors.grey,),                
                Text(
                  '  ' +
                  imageList[index].imageTime.hour.toString() + 'hrs' +
                  imageList[index].imageTime.minute.toString() + 'min'  
                )
              ],
            ),   
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageDetail(imageData: imageList[index],)),
              );
            },
          );          
        }        
      ),      
    );
  }
}
