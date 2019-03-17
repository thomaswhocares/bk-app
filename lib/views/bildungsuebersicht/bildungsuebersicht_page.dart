import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class Bildungsuebersicht extends StatelessWidget {
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
                  text: Text("Nur Relavante"),
                  outerPadding: EdgeInsets.all(0)
                ),
                CommonWidgets.menuButtonNavigator(
                  context: context,
                  text: Text("Alle Bildungsangebote"),
                  outerPadding: EdgeInsets.all(0)
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
