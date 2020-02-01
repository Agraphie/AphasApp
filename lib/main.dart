import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';
import 'WordsPage.dart';
import 'NumbersPage.dart';
import 'TimePage.dart';
import 'CalendarPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarIconBrightness: Brightness.dark));

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/wordsPage': (context) => WordsPage(),
        '/numbersPage': (context) => NumbersPage(),
        '/timePage': (context) => TimePage(),
        '/calendarPage': (context) => CalendarPage(),
      },
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
