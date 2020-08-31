import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/settings_page.dart';
import 'package:preferencias_usuario_app/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }

  // Drawer _crearMenu(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: [
  //         DrawerHeader(
  //           child: Container(),
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   image: AssetImage('assets/menu-img.jpg'),
  //                   fit: BoxFit.cover)),
  //         ),
  //         ListTile(
  //             leading: Icon(Icons.pages, color: Colors.blue),
  //             title: Text('Home'),
  //             onTap: () {
  //               Navigator.pushReplacementNamed(context, HomePage.routeName);
  //             }),
  //         ListTile(
  //             leading: Icon(Icons.pages, color: Colors.blue),
  //             title: Text('Party'),
  //             onTap: () {}),
  //         ListTile(
  //             leading: Icon(Icons.pages, color: Colors.blue),
  //             title: Text('People'),
  //             onTap: () {}),
  //         ListTile(
  //             leading: Icon(Icons.settings, color: Colors.blue),
  //             title: Text('Settings'),
  //             onTap: () {
  //               // Navigator.pop(context);
  //               Navigator.pushReplacementNamed(context, SettingsPage.routeName);
  //             }),
  //       ],
  //     ),
  //   );
  // }
}
