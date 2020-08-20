import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _with = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  Color _backgroundColor = Colors.black;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: _with,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: _color,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.amber,
        elevation: 20,
        onPressed: _incrementarForma,
      ),
    );
  }

  void _incrementarForma() {
    final random = Random();
    final random2 = Random();

    setState(() {
      _with = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _backgroundColor = Color.fromARGB(
          random2.nextInt(255), random2.nextInt(255), random2.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
