import 'package:aphas_app/word_page.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordWidget extends StatelessWidget {
  final Word _word;

  const WordWidget(this._word);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              _word.word,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(_word.img, height: 200),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            createFlag("DE"),
            SizedBox(
              width: 5,
            ),
            createFlag("GB"),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createFlag("PL"),
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget createFlag(final String isoCode) {
    return Container(
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
        child: Flags.getFullFlag(isoCode, 100, null),
      ),
    );
  }
}
