import 'package:aphas_app/word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Word {
  String word;
  String img;

  Word(this.word, this.img);
}

class WordPage extends StatefulWidget {
  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  List<Word> words = [
    Word("Weihnachten", "https://i.ytimg.com/vi/jV7UqFIOcm4/hqdefault.jpg"),
    Word("Kerze", "https://i.ytimg.com/vi/XXMinSgKw7U/maxresdefault.jpg"),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) {
                var word = words[_currentIndex];
                return WordWidget(word);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              controlButton(Icons.arrow_back, Colors.red, () {
                setState(() {
                  _currentIndex = _currentIndex - 1 > 0 ? _currentIndex - 1 : 0;
                });
              }),
              controlButton(Icons.arrow_forward, Colors.green, () {
                setState(() {
                  _currentIndex = _currentIndex + 1 < words.length
                      ? _currentIndex + 1
                      : words.length - 1;
                });
              })
            ],
          )
        ],
      ),
    );
  }

  Widget controlButton(final IconData arrow, Color color, Function callback) {
    return IconButton(
      padding: EdgeInsets.all(20),
      icon: Icon(arrow),
      color: color,
      onPressed: callback,
      iconSize: 48,
    );
  }
}
