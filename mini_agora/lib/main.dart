import 'package:flutter/material.dart';
import 'screens/mini_agora_descriptions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MiniAorgHomePage(),
    );
  }
}
