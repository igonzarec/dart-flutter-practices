import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(OrangeChat());

//CODE TO CHANGE THEME
// final ThemeData kIOSTheme = ThemeData(
//   primarySwatch: Colors.orange,
//   primaryColor: Colors.grey[100],
//   primaryColorBrightness: Brightness.light,
// );

// final ThemeData kDefaultTheme = ThemeData(
//   primarySwatch: Colors.purple,
//   accentColor: Colors.orangeAccent[400],
// );

final ThemeData orangeTheme = ThemeData(
    primarySwatch: Colors.orange,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
    primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white)));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OrangeChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FriendlyChat',
      //to apply themes to phone. In my case it does not apply, because I changed the colors hardcoding
      // theme: defaultTargetPlatform == TargetPlatform.iOS
      //     ? kIOSTheme
      //     : kDefaultTheme,
      theme: orangeTheme,
      home: ChatScreen(),
    );
  }
}

class ChatMessage extends StatelessWidget {
  // const ChatMessage({Key key}) : super(key: key);
  ChatMessage({this.text, this.animationController});
  final String text;
  final String _name = "Orange";
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    //SizeTransition serves for the animation with
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.easeOutCirc),
      axisAlignment: 0.0,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Text(
                      _name[0],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )),
              //Thanks to this, the text does not overflow the space and it
              //wraps so tha the entire message displays.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_name, style: GoogleFonts.raleway(fontSize: 25)),
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Text(
                        text,
                        style: GoogleFonts.raleway(),
                      ),
                    )
                  ],
                ),
              )
            ],

//https://codelabs.developers.google.com/codelabs/flutter/#6
//Add a Row to the build() method for ChatMessage:
          )),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          'Orange Chat',
          style: GoogleFonts.jockeyOne(),
        ),
        elevation: 8.0,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Colors.orange[50]),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
//to have the same color as the theme
// return IconTheme(
//   data: IconThemeData(color: Theme.of(context).accentColor), // NEW
//   child: Container(
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
              //para tener el enviar mensaje desactivado cuando no hay texto
              child: TextField(
            onChanged: (String text) {
              setState(() {
                _isComposing = text.length > 0;
              });
            },
            //always remember that a TextField requieres a controller
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: InputDecoration.collapsed(
              hintText: "Hey Orange, send your message",
              hintStyle: GoogleFonts.raleway(),
            ),
            focusNode: _focusNode,
            style: GoogleFonts.raleway(),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.send),
              onPressed: _isComposing
                  ? () => _handleSubmitted(_textController.text)
                  : null,
            ),
          )
        ],
      ),
    );
  }

//this Animation Controller with Size Transition make the animation posible
  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 800),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  //this method disposes of the animation to free up resources
  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
