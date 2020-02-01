import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String text;
  final String imagePath;
  final String route;

  MainCard({this.color, this.text, this.imagePath, this.route}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Expanded(
        child: Card(
          margin: EdgeInsets.all(8.0),
          elevation: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: color,
                  child: Image.asset(imagePath),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
