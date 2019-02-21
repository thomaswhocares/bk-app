import 'package:flutter/material.dart';
import 'package:bkapp/utils/colorManager.dart';

class MainMenuEntry extends StatefulWidget {
  //inline constructor
  final String _route, _text;
  final ColorManager _colorManager;
  MainMenuEntry(this._colorManager, this._text, this._route);

  @override
  MainMenuEntryState createState() =>
      new MainMenuEntryState(this._colorManager, this._text, this._route);
}

class MainMenuEntryState extends State<MainMenuEntry> {
  final ColorManager _colorManager;

  String _text, _route;
  MainMenuEntryState(this._colorManager, this._text, this._route);

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
              style: TextStyle(color: this._colorManager.textColor,fontSize: 20),
            ),
            highlightColor: this._colorManager.highlight,
            color: this._colorManager.buttonBackground,
          ),
        ),
      ],
    );
  }
}
/*
*
* Expanded(
          child: Container(
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
            decoration: BoxDecoration(border: Border.all()),
          ),
        )
* */
