//system
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp/views/home_page/navigation_widgets.dart';
import 'package:bkapp/views/common_widgets/common_widgets.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              //Obere menü buttons;
              TopMenuBar(),
              Expanded(
                child: RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  shape:
                      CircleBorder(side: BorderSide(style: BorderStyle.none)),
                  onPressed: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Theme.of(context).primaryColor,
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
    );
  }
}
