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

  onPressed() {
    Navigator.of(context).pushNamed(this._route);
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: onPressed,
            child: Text(
              this._text,
              style: Theme.of(context).primaryTextTheme.body1,
            ),
            splashColor: Theme.of(context).primaryColor,
            highlightColor: Colors.transparent,
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ],
    );
  }
}
