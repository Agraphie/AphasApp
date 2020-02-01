import 'package:aphas_app/word_page.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatefulWidget {
  final Word _word;
  final Function(String, String) _speak;

  const WordWidget(this._word, this._speak);

  @override
  _WordWidgetState createState() => _WordWidgetState();
}

class _WordWidgetState extends State<WordWidget> {
  String _currentText;

  @override
  void initState() {
    super.initState();
    _currentText = widget._word.defaultWord ?? widget._word.wordGer;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints.expand(width: MediaQuery.of(context).size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                _currentText,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(widget._word.img, height: 150),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    createFlag("DE", () {
                      String word =
                          widget._word.defaultWord ?? widget._word.wordGer;
                      widget._speak("de-DE", word);
                      setState(() {
                        _currentText = word;
                      });
                    }),
                    SizedBox(
                      width: 5,
                    ),
                    createFlag("GB", () {
                      String word =
                          widget._word.defaultWord ?? widget._word.wordEn;
                      widget._speak("en-GB", word);
                      setState(() {
                        _currentText = word;
                      });
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    createFlag("PL", () {
                      String word =
                          widget._word.defaultWord ?? widget._word.wordPl;
                      widget._speak("pl-PL", word);
                      setState(() {
                        _currentText = word;
                      });
                    }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createFlag(final String isoCode, final Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              // has the effect of softening the shadow
              spreadRadius: 0,
              // has the effect of extending the shadow
              offset: Offset(
                3.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Flags.getFullFlag(isoCode, 80, null),
        ),
      ),
    );
  }
}
