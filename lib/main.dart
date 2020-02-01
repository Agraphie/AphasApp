import 'package:aphas_app/word_page.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarIconBrightness: Brightness.dark));

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordPage(),
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Title(
          title: 'Aphasapp',
          color: Colors.black,
          child: Text('AphasApp'),
        ),
      ),
      backgroundColor: Colors.white,
      body: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      // symmetric(vertical: 64.0, horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MainCard(
                color: Color.fromRGBO(255, 251, 210, 1.0),
                text: 'Words',
                imagePath: 'images/Group7.png',
              ),
              MainCard(
                color: Color.fromRGBO(212, 238, 255, 1.0),
                text: 'Numbers',
                imagePath: 'images/Group8.png',
              ),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MainCard(
                color: Color.fromRGBO(255, 223, 223, 1.0),
                text: 'Time',
                imagePath: 'images/Group5.png',
              ),
              MainCard(
                color: Color.fromRGBO(203, 252, 223, 1.0),
                text: 'Calendar',
                imagePath: 'images/Group6.png',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
