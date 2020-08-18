//imported packages

import 'package:flutter/material.dart';

//personal packages
//import 'package:constituents/src/pages/home_temp.dart';
import 'package:constituents/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Constituents',
        home: HomePage());
  }
}
