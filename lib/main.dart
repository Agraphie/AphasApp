import 'package:flutter/material.dart';

import 'home_page.dart';
import 'word_page.dart';
import 'number_page.dart';
import 'time_page.dart';
import 'calendar_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/wordPage': (context) => WordPage(),
        '/numberPage': (context) => NumberPage(),
        '/timePage': (context) => TimePage(),
        '/calendarPage': (context) => CalendarPage(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
