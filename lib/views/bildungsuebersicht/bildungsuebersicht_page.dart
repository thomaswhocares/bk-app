import 'package:bkapp/views/common_widgets/common_widgets.dart' as CommonWidgets;
import 'package:flutter/material.dart';

class Bildungsuebersicht extends StatefulWidget {
  Bildungsuebersicht({Key key}): super(key : key);
  @override
  _BildungsuebersichtState createState() => _BildungsuebersichtState();
}

class _BildungsuebersichtState extends State<Bildungsuebersicht> {
  @override
  Widget build(BuildContext context) {

   
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.bildungsuebersicht,
      children: <Widget>[
        Expanded(child: CustomScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context,index) => _DummyElement(),
                childCount: 200
              ),
            )
          ],
        ),)
      ] 
      );
  }
}

class _DummyElement extends StatelessWidget {
  
  BuildContext _context;
  _DummyElement({Key key}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
