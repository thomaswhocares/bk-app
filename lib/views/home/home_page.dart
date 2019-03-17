//system
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                _mainMenuEntry(
                  context: context,
                  textString: "Bildungsübersicht",
                  stringRouteName: "/bildungsübersicht",
                ),
                _mainMenuEntry(
                  context: context,
                  textString: "****",
                  stringRouteName: "/bildungsübersicht",
                ),
                _mainMenuEntry(
                  context: context,
                  textString: "Kontakt",
                  stringRouteName: "/404",
                ),
                _mainMenuEntry(
                  context: context,
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

Widget _mainMenuEntry(
    {@required BuildContext context,
    String stringRouteName,
    String textString}) {
  return new Row(
    children: <Widget>[
      Expanded(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(stringRouteName);
          },
          child: Text(
            textString,
            style: Theme.of(context).primaryTextTheme.body1,
          ),
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Colors.transparent,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    ],
  );
}
