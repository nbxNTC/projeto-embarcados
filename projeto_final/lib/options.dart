import 'package:flutter/material.dart';

class Options extends StatelessWidget {

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
                  Navigator.popAndPushNamed(context, '/home');
                },
              );
            }),
        title: Text("Options"),
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
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FlatButton(
                    color: Colors.cyan,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/registeremail');
                    },
                    child: Text(
                      "Register e-mail",
                      style: TextStyle(fontSize: 17),
                    ),
                  )
              ),
              new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FlatButton(
                    color: Colors.cyan,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/removeemail');
                    },
                    child: Text(
                      "Remove e-mail",
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