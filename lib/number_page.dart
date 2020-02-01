import 'dart:math';

import 'package:aphas_app/word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'word_page.dart';

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

enum TtsState { playing, stopped }

class _NumberPageState extends State<NumberPage> {
  List<Word> words = [
    Word(defaultWord: "30"),
    Word(defaultWord: "36"),
  ];
  int _currentIndex = 0;
  FlutterTts flutterTts;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  TtsState ttsState = TtsState.stopped;
  String _newVoiceText;

  var range = Random();

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

          words.add(Word(defaultWord: range.nextInt(100).toString()));
        })
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class Number {
//   String number;
//   String numberGer;
//   String numberEn;
//   String numberPl;

//   Number({this.numberEn, this.numberGer, this.numberPl});
// }

// class NumberPage extends StatefulWidget {
//   @override
//   _NumberPageState createState() => _NumberPageState();
// }

// enum TtsState { playing, stopped }

// class _NumberPageState extends State<NumberPage> {
//   List<Number> numbers = [
//     Number(
//       numberEn: 'thiry',
//       numberGer: 'thirty',
//       numberPl: 'thirty',
//     ),
//   ];

//   int _currentIndex = 0;
//   FlutterTts flutterTts;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;
//   TtsState ttsState = TtsState.stopped;
//   String _newVoiceText;

//   @override
//   initState() {
//     super.initState();
//     initTts();
//   }

//   initTts() {
//     flutterTts = FlutterTts();
//     flutterTts.setLanguage("de-DE");

//     flutterTts.setStartHandler(() {
//       setState(() {
//         ttsState = TtsState.playing;
//       });
//     });

//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         ttsState = TtsState.stopped;
//       });
//     });

//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         ttsState = TtsState.stopped;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Title(
//           title: 'Numbers',
//           color: Colors.black,
//           child: Text('Numbers'),
//         ),
//         elevation: 0.0,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: numbers.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (BuildContext context, int index) {
//                 var word = numbers[_currentIndex];
//                 return WordWidget(word, (isoCode, speakWord) {
//                   flutterTts.setLanguage(isoCode);
//                   setState(() {
//                     _newVoiceText = speakWord;
//                     _speak();
//                   });
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Center(
// //             child: Title(
// //               child: Text(
// //                 'Thirty',
// //                 style: Theme.of(context).textTheme.display1,
// //               ),
// //               color: Colors.black,
// //             ),
// //           ),
// //           Center(
// //             child: Title(
// //               child: Text(
// //                 '30',
// //                 style: Theme.of(context).textTheme.display3,
// //               ),
// //               color: Colors.black,
// //             ),
// //           ),
