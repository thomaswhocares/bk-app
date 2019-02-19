import 'package:flutter/material.dart';

class MainMenuEntry extends StatefulWidget {
  //inline constructor
  final String _route, _text;
  MainMenuEntry(this._text, this._route);

  @override
  MainMenuEntryState createState() =>
      new MainMenuEntryState(this._text, this._route);
}

class MainMenuEntryState extends State<MainMenuEntry> {
  String _text, _route;
  MainMenuEntryState(this._text, this._route);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(this._route);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 2, 20),
              child: new Text(
                this._text,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        )
      ],
    );
  }
}
