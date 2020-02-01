import 'package:aphas_app/word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Word {
  String defaultWord;
  String wordGer;
  String wordEn;
  String wordPl;
  String img;

  Word({this.wordGer, this.wordEn, this.wordPl, this.img});
}

class WordPage extends StatefulWidget {
  @override
  _WordPageState createState() => _WordPageState();
}

enum TtsState { playing, stopped }

class _WordPageState extends State<WordPage> {
  List<Word> words = [
    Word(
        wordGer: "Weihnachten",
        img: "https://i.ytimg.com/vi/jV7UqFIOcm4/hqdefault.jpg",
        wordEn: "Christmas",
        wordPl: "Boze Nouvodzenie"),
    Word(
        img: "https://i.ytimg.com/vi/XXMinSgKw7U/maxresdefault.jpg",
        wordGer: "Kerze",
        wordEn: "Candle",
        wordPl: "Świeca"),
  ];
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
    // await flutterTts.setVolume(volume);
    //  await flutterTts.setSpeechRate(rate);
    //await flutterTts.setPitch(pitch);

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
            _currentIndex = _currentIndex + 1 < words.length
                ? _currentIndex + 1
                : words.length - 1;
          });
        })
      ],
    );
  }
}
