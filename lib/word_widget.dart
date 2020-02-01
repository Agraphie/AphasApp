import 'package:aphas_app/word_page.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  final Word _word;
  final Function(String, String) _speak;

  const WordWidget(this._word, this._speak);

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
                _word.wordGer,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(_word.img, height: 150),
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
                      _speak("de-DE", _word.wordGer);
                    }),
                    SizedBox(
                      width: 5,
                    ),
                    createFlag("GB", () {
                      _speak("en-GB", _word.wordEn);
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
                      _speak("pl-PL", _word.wordPl);
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
