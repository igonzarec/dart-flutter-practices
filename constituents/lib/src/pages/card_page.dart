import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
            SizedBox(height: 30),
          ],
        ));
  }
}

Widget _cardTipo1() {
  return Card(
    elevation: 25,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Im this cards title'),
          subtitle: Text(
              'A card is a sheet of Material used to represent some related information, for example an album, contact details, etc.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('OKS'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _cardTipo2() {
  final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
    children: [
      FadeInImage(
          image: NetworkImage(
              'https://iso.500px.com/wp-content/uploads/2017/10/PhotographingTwilight_TannerWendellStewart-218136823.jpg'),
          fadeInCurve: Curves.bounceIn,
          placeholder: AssetImage('data/assets/jar-loading.gif')),

      //Image(
      //  image: NetworkImage(
      //      'https://stainesandbrights-static.myshopblocks.com/images/2019/01/resize/256x256/8a5466014190d61e109cd6af1a844f9d.jpg'),
      //),
      Container(
          padding: EdgeInsets.all(10.0), child: Text('Chek out this landscape'))
    ],
  ));

  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ]),
    child: card,
  );
}
