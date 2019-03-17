import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class BildungsuebersichtSplash extends StatelessWidget {
  bool f = false;
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
                Row(
                  children: <Widget>[
                    Transform.scale(
                      scale: 2,
                      child: _CheckboxDingens(),
                    ),
                    Text("Nicht nochmal fragen.")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
// TODO JUST FOR EXAPLE
class _CheckboxDingens extends StatefulWidget {
  @override
  _CheckboxDingensState createState() => _CheckboxDingensState();
}

class _CheckboxDingensState extends State<_CheckboxDingens> {
  bool f = false;
  
  void onClick(bool change){
    setState(() {
      f = !f;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: f,
      tristate: true,
      
      onChanged: (bool changed) {
        onClick(changed);
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}
//-- END TODO