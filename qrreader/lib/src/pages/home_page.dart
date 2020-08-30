import 'package:barcode_scan/barcode_scan.dart';

import 'package:flutter/material.dart';
//import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreader/src/bloc/scans_bloc.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:qrreader/src/pages/direcciones_page.dart';
import 'package:qrreader/src/pages/mapas_pages.dart';
import 'package:qrreader/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarScanTODOS,
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones'))
      ],
    );
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  _scanQR(BuildContext context) async {
    //https://www.facebook.com/ivanyoed

    //geo:40.69716778063721,-73.93041029414066

    //dynamic futureString = '';

    // https://fernando-herrera.com
    // geo:40.724233047051705,-74.00731459101564

    // String futureString = '';

    ScanResult futureString;

    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString.rawContent = e.toString();
    }

    if (futureString != null) {
      final scan = ScanModel(valor: futureString.rawContent);

      scansBloc.abrirScan(context, scan);
      scansBloc.agregarScan(scan);
      scansBloc.obtenerScans();
    }
  }
}
