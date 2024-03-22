import 'package:flutter/material.dart';
import 'ToDo.dart';
import 'ToDo_App.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataList(),
    );
  }
}
