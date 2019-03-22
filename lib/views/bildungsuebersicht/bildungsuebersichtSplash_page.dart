import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class BildungsuebersichtSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Hey",
                  textScaleFactor: 4,
                ),
              ),
              Text(
                "Do you come here often ?",
                textScaleFactor: 2,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CommonWidgets.menuButtonNavigator(
                    context: context,
                    text: Text("Nur relavante Bildungsangebote"),
                    outerPadding: EdgeInsets.all(0)),
                CommonWidgets.menuButtonNavigator(
                    context: context,
                    text: Text("Alle Bildungsangebote"),
                    stringRouteName: "/bildungsuebersicht",
                    outerPadding: EdgeInsets.all(0)),
                Row(children: <Widget>[
                  CheckboxButton()
                ],)
              ],
            ),
          ),
        )
      ],
    );
  }
}

//TODO braucht verbindung
class CheckboxButton extends StatefulWidget {
  CheckboxButton({Key key}) : super(key: key);

  _CheckboxButtonState createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  @override
  bool f = false;

  void onClick() {
    setState(() {
      f = !f;
    });
  }

  Widget build(BuildContext context) {
    return RaisedButton(
      shape: Border.all(color: Colors.transparent),
      onPressed: () {
        onClick();
      },
      child: Row(
        children: <Widget>[
          IgnorePointer(
            child: Transform.scale(
              scale: 1,
              child: Checkbox(
                value: f,
                tristate: false,
                onChanged: (bool changed) {
                  onClick();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
          Text("Nicht nochmal fragen.")
        ],
      ),
    );
  }
}

