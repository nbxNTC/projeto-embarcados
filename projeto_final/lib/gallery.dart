import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.white,
            icon: Icon(Icons.image),
            onPressed: () {},
          );
        }),
        title: Text("Gallery"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Padding (
              padding: const EdgeInsets.all(8),              
              child: GestureDetector (
                onTap: (){ 
                  Navigator.of(context).pushNamed('/example');
                },
                child: DecoratedBox (                             
                  decoration: BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                  ),                                           
                )
              )           
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              ),                         
            ),            
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/3.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
            Padding (
              padding: const EdgeInsets.all(8),              
              child: DecoratedBox (
                decoration: BoxDecoration(
                  image: DecorationImage (
                    image: AssetImage('assets/4.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                ),                                           
              )              
            ),
          ],
        ),
      ),
    );
  }
}
