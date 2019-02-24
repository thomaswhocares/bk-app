//system
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp/views/home_page/navigation_widgets.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Homepage extends StatefulWidget {
  Homepage();

  @override
  HomepageState createState() => new HomepageState();
}

class HomepageState extends State<Homepage> {
  HomepageState(

    );

  @override
  void onClick() {

  }

  onReload(){
    debugPrint("Reloading Wigets");
    //theme
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).backgroundColor);
    FlutterStatusbarcolor.setNavigationBarColor(Theme.of(context).backgroundColor);
    if(useWhiteForeground(Theme.of(context).backgroundColor)){
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }else{
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    onReload();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
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
                                color: Theme.of(context).primaryColor)),
                        color: Theme.of(context).backgroundColor,
                        child: Icon(
                          Icons.menu,
                          color: Theme.of(context).primaryColor,
                        ),
                        splashColor: Theme.of(context).primaryColor,
                        onPressed: onClick,
                      ),
                      RaisedButton(
                        shape: CircleBorder(
                            side: BorderSide(
                                style: BorderStyle.solid,
                                color: Theme.of(context).primaryColor)),
                        color: Theme.of(context).backgroundColor,
                        child: Icon(
                          Icons.account_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        splashColor: Theme.of(context).primaryColor,
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
        ),
      ),
    );
  }
}
