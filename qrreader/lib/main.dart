import 'package:flutter/material.dart';
import 'package:qrreader/src/pages/home_page.dart';
import 'package:qrreader/src/pages/mapa_page.dart';

//PROYECTO INTERRUMPLIDO DEBIDO A ERRORES

main() {
  //var db = await databaseFactory.openDatabase(inMemoryDatabasePath);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRReader!',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}
