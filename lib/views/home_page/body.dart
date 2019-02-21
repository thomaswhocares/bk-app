//system
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//view
import 'package:bkapp/views/home_page/navigation_widgets.dart';
//utils
import 'package:bkapp/utils/colorManager.dart';

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
    return Scaffold(
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
                          Spacer(),
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
                          Text("sdf")
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
  }
}
