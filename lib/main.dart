import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';
import 'word_page.dart';
import 'number_page.dart';
import 'time_page.dart';
import 'calendar_page.dart';

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
        '/wordPage': (context) => WordPage(),
        '/numberPage': (context) => NumberPage(),
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
