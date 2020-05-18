import 'package:flutter/material.dart';
import 'package:yorumlaa/pages/home.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Yorumlaa",
        home: home(),
    );
  }

}

