import 'package:flutter/material.dart';

class MainMenuEntry extends StatelessWidget {
  final String _text;
  final String _route;

  const MainMenuEntry(this._text, this._route);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(this._route);
            },
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
