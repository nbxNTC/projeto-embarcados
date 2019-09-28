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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.image),
              onPressed: () {
                //Navigator.pushNamed(context, '/nomeDaRota');
              },
            ),
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.airplay),
              onPressed: () {
                //Navigator.pushNamed(context, '/nomeDaRota');
              },
            ),

            IconButton(
              iconSize: 35,
              icon: Icon(Icons.volume_off),
              onPressed: () {
                //Navigator.pushNamed(context, '/nomeDaRota');
              },
            ),
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.filter_vintage),
              onPressed: () {
                Navigator.pushNamed(context, '/options');
              },
            ),
          ],
        ),
      ),
    );
  }

}