import 'package:flutter/material.dart';
import "./style.dart" as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(theme: style.theme, home: const MyApp()),
  );
}

var a = TextStyle(color: Colors.blue);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = [];
  getData() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
    print(data);
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instargram'), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
      ]),
      body: [
        MainContent(data: data),
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: '샵')
          ]),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({Key? key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(data[i]['image']),
                  Text('좋아요 ' + data[i]['likes'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(data[i]['user'] ?? 'null'),
                  Text(data[i]['content'] ?? 'null'),
                ],
              ),
            );
          });
    } else {
      return CircularProgressIndicator();
    }
  }
}
