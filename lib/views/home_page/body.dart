//system
import 'package:flutter/material.dart';
import 'package:bkapp/utils/colorManager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bkapp/views/home_page/navigation_widgets.dart';

class Body extends StatefulWidget {
  final ColorManager colorManager;
  Body(this.colorManager);

  @override
  BodyState createState() => new BodyState(colorManager);
}

class BodyState extends State<Body> {
  final ColorManager colorManager;

  BodyState(this.colorManager);

  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorManager.background,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colorManager.background,
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
                                color: colorManager.highlight)),
                        color: Colors.black,
                        child: Icon(
                          Icons.menu,
                          color: colorManager.highlight,
                        ),
                        splashColor: colorManager.highlight,
                        onPressed: onClick,
                      ),
                      RaisedButton(
                        shape: CircleBorder(
                            side: BorderSide(
                                style: BorderStyle.solid,
                                color: colorManager.highlight)),
                        color: Colors.black,
                        child: Icon(
                          Icons.account_circle,
                          color: colorManager.highlight,
                        ),
                        splashColor: colorManager.highlight,
                        onPressed: onClick,
                      ),
                    ],
                  ),
                  Expanded(child: RaisedButton(
                    color: Colors.transparent,
                    elevation: 0,
                    shape:
                    CircleBorder(side: BorderSide(style: BorderStyle.none)),
                    onPressed: onClick,
                    highlightColor: Colors.transparent,
                    splashColor: colorManager.highlight,
                    child: SvgPicture.asset(
                      'assets/lmao.svg',
                    ),
                  ),)

                ],
              )),
              Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    MainMenuEntry("Routenplaner", "/shoolPathFinder/main"),
                    MainMenuEntry("Stundenplan", "/404"),
                    MainMenuEntry("News", "/404"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(color: colorManager.background),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(11),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        child: Icon(
                          Icons.menu,
                          color: colorManager.highlight,
                          size: 55,
                        ),
                        splashColor: colorManager.highlight,
                        onPressed: onClick,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(60),),
                          MaterialButton(
                            onPressed: onClick,
                            highlightColor: Colors.transparent,
                            splashColor: colorManager.highlight,
                            child: SvgPicture.asset(
                              'assets/lmao.svg',
                              height: 150,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(20),),
                          Text("Berufskolleg für Gestaltung und Technik",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      MaterialButton(
                        child: Icon(
                          Icons.account_circle,
                          color: colorManager.highlight,
                          size: 55,
                        ),
                        splashColor: colorManager.highlight,
                        onPressed: onClick,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorManager.background,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween
                      children: <Widget>[
                        Spacer(flex: 1),
                        MainMenuEntry("Routenplaner", "/shoolPathFinder/main"),
                        MainMenuEntry("Stundenplan", "/404"),
                        MainMenuEntry("News", "/404"),
                        Spacer(flex: 3)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }*/
