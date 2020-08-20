//imported packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//personal packages
//import 'package:constituents/src/pages/home_temp.dart';

import 'package:constituents/src/pages/alert_page.dart';
import 'package:constituents/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('es', 'ES')],

      title: 'Constituents',
      //home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
