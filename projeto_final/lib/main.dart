import 'package:flutter/material.dart';
import 'package:projeto_final/home.dart';
import 'package:projeto_final/registerEmail.dart';
import 'package:projeto_final/removeEmail.dart';

void main() => runApp(EmbarcadosApp());

class EmbarcadosApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }

}