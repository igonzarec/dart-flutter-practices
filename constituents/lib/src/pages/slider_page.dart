import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _blockearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Slider"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckbox(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          ),
        ));
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          "https://retap.com/pub/media/catalog/product/cache/c687aa7517cf01e65c009f6943c2b1e9/r/e/retap_03_-_light_blue_700x700_1_1.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    /*return Checkbox(
      value: _blockearCheck,
      onChanged: (valor) {
        setState(() {
          _blockearCheck = valor;
        });
      },
    );*/
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _blockearCheck,
      onChanged: (valor) {
        setState(() {
          _blockearCheck = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _blockearCheck,
      onChanged: (valor) {
        setState(() {
          _blockearCheck = valor;
        });
      },
    );
  }
}
