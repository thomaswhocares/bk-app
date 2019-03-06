import 'package:bkapp/views/common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class Bildungsuebersicht extends StatefulWidget {
  @override
  _BildungsuebersichtState createState() => _BildungsuebersichtState();
}

class _BildungsuebersichtState extends State<Bildungsuebersicht> {
  @override
  Widget build(BuildContext context) {

    List<Widget> elements = new List(8);

    for (int i=0;i<8;i++){
      elements[i]=(_Entry());
    }

    return CommonPageCollumStyle(
      viewType: ViewType.bildungsuebersicht,
      children: elements);
  }
}

class _Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Ich existiere");
  }
}