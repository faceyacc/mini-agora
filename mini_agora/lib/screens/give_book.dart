import 'package:flutter/material.dart';

class GiveBook extends StatefulWidget {
  @override
  _GiveBookState createState() => _GiveBookState();
}

class _GiveBookState extends State<GiveBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light, // status bar brightness
      ),
    );
  }
}
