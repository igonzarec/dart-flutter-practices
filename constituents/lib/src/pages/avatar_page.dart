import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Avatar Page"),
          actions: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg"),
                radius: 23.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text("SL"),
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
        body: Center(
            child: FadeInImage(
          image: NetworkImage(
              "https://imagenes.milenio.com/RgPclwnOYyEEvkRoqcDCSdOHjKk=/958x596/https://www.milenio.com/uploads/media/2019/02/24/stan-lee-recordado-in-memoriam.jpg"),
          placeholder: AssetImage('data/assets/jar-loading.gif'),
        )));
  }
}
