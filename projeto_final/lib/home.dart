import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                color: Colors.white,
                icon: Icon(Icons.home),
                onPressed: () {
                },
              );
            }),
        title: Text("Home"),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        
      ),      
    );
  }
}