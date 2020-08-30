import 'dart:async';

import 'package:qrreader/src/bloc/validator.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:qrreader/src/providers/db_provider.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:qrreader/src/models/scan_model.dart';

import 'package:flutter/material.dart';

class ScansBloc with Validator {
  //debemos tener una unica instancia del ScansBloc
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    //Obtenemos los scans de la base de datos
    obtenerScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream =>
      _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp =>
      _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.getTodosScans());
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTODOS() async {
    DBProvider.db.deleteAll();
    obtenerScans();
  }

  abrirScan(BuildContext context, ScanModel scan) async {
    if (scan.tipo == 'http') {
      if (await canLaunch(scan.valor)) {
        await launch(scan.valor);
      } else {
        throw 'Could not launch ${scan.valor}';
      }
    } else {
      Navigator.pushNamed(context, 'mapa', arguments: scan);
    }
  }
}

//normalmente estos metodos se ponen en un archivo llamado events, pero dado que nuestro
//archivo es pequeño, por eso no se hará
