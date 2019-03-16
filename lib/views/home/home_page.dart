//system
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp/views/home/navigation_widgets.dart';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;

class Homepage extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.homepage,
      children: <Widget>[
        Expanded(
          child: Column(children: <Widget>[
            //Obere menü buttons;
            Expanded(
              child: RaisedButton(
                color: Colors.transparent,
                elevation: 0,
                shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
                onPressed: () {},
                highlightColor: Colors.transparent,
                splashColor: Theme.of(context).primaryColor,
                child: SvgPicture.asset(
                  'assets/gut_logo.svg',
                ),
              ),
            )
          ]),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                MainMenuEntry(
                  textString: "Bildungsübersicht",
                  stringRouteName: "/bildungsübersicht",
                ),
                MainMenuEntry(
                  textString: "****",
                  stringRouteName: "/bildungsübersicht",
                ),
                MainMenuEntry(
                  textString: "Kontakt",
                  stringRouteName: "/404",
                ),
                MainMenuEntry(
                  textString: "News",
                  stringRouteName: "/404",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
