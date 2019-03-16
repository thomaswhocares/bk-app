import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class Bildungsuebersicht extends StatefulWidget {
  Bildungsuebersicht({Key key}) : super(key: key);
  @override
  _BildungsuebersichtState createState() => _BildungsuebersichtState();
}

class _BildungsuebersichtState extends State<Bildungsuebersicht> {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
        viewType: CommonWidgets.ViewType.bildungsuebersicht,
        children: <Widget>[
          Expanded(
            child: Text("data"),
          )
        ]);
  }
}

class _DummyElement extends StatelessWidget {
  _DummyElement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text("data"),
        )
      ],
    );
  }
}
