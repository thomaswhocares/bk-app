import 'package:bkapp/views/common_widgets/common_widgets.dart' as CommonWidgets;
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
          viewType: CommonWidgets.ViewType.profileView,
          //Common Page ist bereits eine Spallte deswegen kommen nurnoch reihen und andere objekte dazu
          children: <Widget>[

          ],
        );
      }
}
    