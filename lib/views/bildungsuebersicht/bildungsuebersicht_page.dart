import 'package:flutter/material.dart';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;

class Bildungsuebersicht extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text("placeholder"),
        ),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColor), ),

            )),
      ],
    );
  }
}
