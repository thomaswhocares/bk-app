import 'package:flutter/material.dart';

class MainMenuEntry extends StatelessWidget {
  final String textString;
  final String stringRouteName;

  const MainMenuEntry({Key key, this.textString, this.stringRouteName});

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(this.stringRouteName);
            },
            child: Text(
              this.textString,
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
