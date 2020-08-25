import 'package:flutter/services.dart';
import 'package:designs/src/pages/basico_page.dart';
import 'package:designs/src/pages/botones_page.dart';
import 'package:designs/src/pages/scroll_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.pink[300]));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'botones',
        routes: {
          'basico': (BuildContext context) => BasicoPage(),
          'scroll': (BuildContext context) => ScrollPage(),
          'botones': (BuildContext context) => BotonesPage(),
        });
  }
}
