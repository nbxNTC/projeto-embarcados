import 'package:flutter/material.dart';

class CadastraEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {

                  },
                );
              }),
          title: Text("Cadastrar e-mail"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("VOCE"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}