//system
import 'package:flutter/material.dart';
import 'package:bkapp/utils/colorManager.dart' as ColorManager;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bkapp/views/home_page/navigation_widgets.dart';

class Body extends StatefulWidget {
  Body();

  @override
  BodyState createState() => new BodyState();
}

class BodyState extends State<Body> {
  BodyState();

  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.background,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.background,
          body: Column(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RaisedButton(
                        shape: CircleBorder(
                            side: BorderSide(
                                style: BorderStyle.solid,
                                color: ColorManager.highlight)),
                        color: Colors.black,
                        child: Icon(
                          Icons.menu,
                          color: ColorManager.highlight,
                        ),
                        splashColor: ColorManager.highlight,
                        onPressed: onClick,
                      ),
                      RaisedButton(
                        shape: CircleBorder(
                            side: BorderSide(
                                style: BorderStyle.solid,
                                color: ColorManager.highlight)),
                        color: Colors.black,
                        child: Icon(
                          Icons.account_circle,
                          color: ColorManager.highlight,
                        ),
                        splashColor: ColorManager.highlight,
                        onPressed: onClick,
                      ),
                    ],
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: CircleBorder(
                          side: BorderSide(style: BorderStyle.none)),
                      onPressed: onClick,
                      highlightColor: Colors.transparent,
                      splashColor: ColorManager.highlight,
                      child: SvgPicture.asset(
                        'assets/lmao.svg',
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      MainMenuEntry("Routenplaner", "/shoolPathFinder/main"),
                      MainMenuEntry("Stundenplan", "/404"),
                      MainMenuEntry("News", "/404"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
