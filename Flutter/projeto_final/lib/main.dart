import 'package:flutter/material.dart';
import 'selectDevice.dart';
import 'imageDetail.dart';
import 'home.dart';
import 'options.dart';
import 'registerEmail.dart';
import 'removeEmail.dart';
import 'liveCam.dart';
import 'BluetoothConfiguration.dart';

void main() => runApp(
  MaterialApp(
    title: 'DoorBell',
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      iconTheme: IconThemeData(color: Colors.white),
      primaryTextTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
        ),
      ),
    ),     
    routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => MyTabs(),
        '/registeremail' : (BuildContext context) => RegisterEmail(),
        '/removeemail' : (BuildContext context) => RemoveEmail(),        
        '/imagedetail' : (BuildContext context) => ImageDetail(),
        '/selectdevice' : (BuildContext context) => SelectDevice(),
        '/bluetooth' : (BuildContext context) => BluetoothConfiguration(),
      },
    debugShowCheckedModeBanner: false,
  )
);

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose(); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      bottomNavigationBar: Material(
        color: Colors.cyan,
        child:  TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(icon: Icon(Icons.home, color: Colors.white)),
            Tab(icon: Icon(Icons.wifi, color: Colors.white)),
            Tab(icon: Icon(Icons.settings, color: Colors.white)),
          ],
        )
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Home(),
          BluetoothConfiguration(),
          Options()
        ],
      ),
    );
  }
}