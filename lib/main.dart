import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zaplanuj ogrodzenie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        // height: 200,
        // width: 200,
        color: Colors.red,
        child: const Text('Hej'),
      ),
    );
  }
}
