import 'package:flutter/material.dart';

class CadastraEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
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
    );
  }

}