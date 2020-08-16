import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

final _estiloTexto = TextStyle(fontSize: 30.0);
int _a = 0;

class _ContadorPageState extends State<ContadorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basic App'),
          centerTitle: true,
          elevation: 10.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tapp number',
                style: _estiloTexto,
              ),
              Text(
                '$_a',
                style: _estiloTexto,
              ),
            ],
          ),
        ),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30.0),
        FloatingActionButton(
          onPressed: _toZero,
          child: Icon(Icons.exposure_zero),
        ),
        Expanded(child: SizedBox(width: 30.0)),
        FloatingActionButton(
          onPressed: _subtract,
          child: Icon(Icons.remove),
        ),
        SizedBox(width: 30.0),
        FloatingActionButton(
          onPressed: _add,
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  void _add() {
    setState(() {
      _a++;
    });
  }

  void _subtract() {
    setState(() {
      _a--;
    });
  }

  void _toZero() {
    setState(() {
      _a = 0;
    });
  }
}
