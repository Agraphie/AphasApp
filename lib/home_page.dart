import 'package:flutter/material.dart';

import 'card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Title(
          title: 'AphasApp',
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
                route: '/wordPage',
              ),
              MainCard(
                color: Color.fromRGBO(212, 238, 255, 1.0),
                text: 'Numbers',
                imagePath: 'images/Group8.png',
                route: '/numberPage',
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
                route: '/timePage',
              ),
              MainCard(
                color: Color.fromRGBO(203, 252, 223, 1.0),
                text: 'Calendar',
                imagePath: 'images/Group6.png',
                route: '/calendarPage',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
