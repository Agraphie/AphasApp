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
      home: Home(),
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
              MainCard(),
              MainCard(),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MainCard(),
              MainCard(),
            ],
          )),
        ],
      ),
    );
  }
}
