import 'package:flutter/material.dart';
import 'package:projeto_final/cadastraEmails.dart';

void main() => runApp(CadastraEmail());

class EmbarcadosApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {

                  },
                );
              }),
          title: Text("Home"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("VOCE"),
                  Text("VOCE"),
                  Text("VOCE")
                ],
              ),
          )
        )
      )
    );
  }

}