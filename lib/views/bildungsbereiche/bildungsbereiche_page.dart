import 'package:bkapp/views/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class BildungsbereichPage extends StatefulWidget {
  @override
  BildungsbereichPageState createState() => new BildungsbereichPageState();
}

class BildungsbereichPageState extends State<BildungsbereichPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPageCollumStyle(
      viewType: ViewType.bildungsbereiche,
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Was ist das hier",
                    textScaleFactor: 4,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
