import 'package:flutter/material.dart';

class RemoveEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Remove e-mail"),       
      ),
      body: Padding(
        padding: EdgeInsets.all(20),        
        child: ListView(          
          children: <Widget>[
            Padding (
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your e-mail',
                    contentPadding: EdgeInsets.all(10),
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: FlatButton(
                  color: Colors.cyan,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Remove",
                    style: TextStyle(fontSize: 17),
                  ),
                )
            )
          ],
        ),        
      ),
    );
  }
}