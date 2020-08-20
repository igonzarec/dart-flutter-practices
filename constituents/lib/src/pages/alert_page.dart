import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Mostar alerta"),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlerta(context)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("Paul Fleming, An sich"),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Text("Sei dennoch unverzagt! Gib dennoch unverloren!"
                  "Weich keinem Glücke nicht, steh höher als der Neid,"
                  "vergnüge dich an dir und acht es für kein Leid,"
                  "hat sich gleich wider dich Glück, Ort und Zeit verschworen."
                  "\n\nWas dich betrübt und labt, halt alles für erkoren;"
                  "nimm dein Verhängnis an. Laß alles unbereut."
                  "Tu, was getan muß sein, und eh man dir's gebeut."
                  "Was du noch hoffen kannst, das wird noch stets geboren."),
              FlutterLogo(
                size: 100.0,
              )
            ]),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
