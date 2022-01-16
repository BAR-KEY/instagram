import 'package:flutter/material.dart';
import "./style.dart" as style;

void main() {
  runApp(
    MaterialApp(theme: style.theme, home: const MyApp()),
  );
}

var a = TextStyle(color: Colors.blue);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instargram'), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined))
      ]),
    );
  }
}
