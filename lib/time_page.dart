import 'dart:math';

import 'package:aphas_app/word_page.dart';
import 'package:aphas_app/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';

class TimePage extends StatefulWidget {
  var random = Random(DateTime.now().millisecondsSinceEpoch);
  DateFormat _dateFormat = DateFormat.Hm();

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  List<Word> words = [];
  int _currentIndex = 0;
  FlutterTts flutterTts;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  TtsState ttsState = TtsState.stopped;
  String _newVoiceText;

  @override
  initState() {
    super.initState();
    initTts();
    DateTime now = DateTime.now();
    String time = widget._dateFormat.format(now);

    words.add(Word(defaultWord: time, dateTime: now));
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage("de-DE");

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: words.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                var word = words[_currentIndex];
                return WordWidget(word, (isoCode, speakWord) {
                  flutterTts.setLanguage(isoCode);
                  setState(() {
                    _newVoiceText = speakWord;
                    _speak();
                  });
                });
              },
            ),
          ),
          buildControlButtons()
        ],
      ),
    );
  }

  Widget controlButton(final IconData arrow, Color color, Function callback) {
    return IconButton(
      padding: EdgeInsets.all(15),
      icon: Icon(arrow),
      color: color,
      onPressed: callback,
      iconSize: 40,
    );
  }

  Future _speak() async {
    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Widget buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        controlButton(Icons.arrow_back, Colors.red, () {
          setState(() {
            _currentIndex = _currentIndex - 1 > 0 ? _currentIndex - 1 : 0;
          });
        }),
        controlButton(Icons.arrow_forward, Colors.green, () {
          setState(() {
            if (_currentIndex + 1 >= words.length) {
              DateTime newDate = randomDate();
              String time = widget._dateFormat.format(newDate);
              words.add(Word(defaultWord: time, dateTime: newDate));
            }
            _currentIndex = _currentIndex + 1 < words.length
                ? _currentIndex + 1
                : words.length - 1;
          });
        })
      ],
    );
  }

  DateTime randomDate([DateTime firstMoment, DateTime secondMoment]) {
    firstMoment ??= DateTime.fromMillisecondsSinceEpoch(0);
    secondMoment ??= DateTime.now();

    secondMoment.isBefore(firstMoment)
        ? throw ArgumentError('Second DateTime '
            'moment should be after first DateTime moment.')
        : null;

    Duration difference = secondMoment.difference(firstMoment);

    return firstMoment.add(
        Duration(seconds: widget.random.nextInt(difference.inSeconds + 1)));
  }
}
