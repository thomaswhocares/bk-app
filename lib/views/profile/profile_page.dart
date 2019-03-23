import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.profileView,
      //Common Page ist bereits eine Spallte deswegen kommen nurnoch reihen und andere objekte dazu
      children: <Widget>[
        Expanded(
          flex: 2,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return RaisedButton(
                //We do not need inner padding
                padding: EdgeInsets.all(0),
                shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
                onPressed: () {},
                child: Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("http://192.168.2.175/avatar.png"),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Text("data"),
        )
      ],
    );
  }
}
