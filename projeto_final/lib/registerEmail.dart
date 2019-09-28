import 'package:flutter/material.dart';

class RegisterEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/options');
                },
              );
            }),
        title: Text("Register e-mail"),
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
              Container (
                margin: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter your name',
                      contentPadding: EdgeInsets.all(10),
                  ),
                )
              ),
              Container (
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your e-mail',
                        contentPadding: EdgeInsets.all(10),
                    ),
                  )
              ),
              Container (
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your phone number',
                        contentPadding: EdgeInsets.all(10),
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FlatButton(
                  color: Colors.cyan,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 17),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}