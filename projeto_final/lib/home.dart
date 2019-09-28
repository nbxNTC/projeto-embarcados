import 'package:flutter/material.dart';




class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Page 0',
      style: optionStyle,
    ),
    Text(
      'Page 1',
      style: optionStyle,
    ),
    Text(
      'Page 2',
      style: optionStyle,
    ),
    Text(
      'Page 3',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplay),
            title: Text('Live'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volume_off),
            title: Text('Mute'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage),
            title: Text('Options'),
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}