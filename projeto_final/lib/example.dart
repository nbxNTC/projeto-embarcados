import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Example"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),        
        child: Column(
          children: <Widget>[
            Image.asset('assets/1.jpg'),                    
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text(              
                '3:00PM - 30/Sep/19',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),    
            ),                
          ]         
        )          
      ),
    );
  }
}
