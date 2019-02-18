import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp/home_page/navigation_widgets.dart';


class Body extends StatefulWidget {
  @override
  BodyState createState() => new BodyState();
}

class BodyState extends State<Body> {
  double space = 10.3;
  void onClick() {}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SafeArea(
          child: new Container(
            child: new Center(
              child: Padding(
                padding: EdgeInsets.all(space),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new MaterialButton(
                            child: new Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 70,
                            ),
                            splashColor: Color.fromARGB(255, 226, 0, 122),
                            onPressed: onClick,
                          ),
                          new MaterialButton(
                            onPressed: onClick,
                            highlightColor: Colors.transparent,
                            splashColor: Color.fromARGB(255, 226, 0, 122),
                            child: new SvgPicture.asset(
                              'assets/lmao.svg',
                              height: 222,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          new MaterialButton(
                            child: new Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 70,
                            ),
                            splashColor: Color.fromARGB(255, 226, 0, 122),
                            onPressed: onClick,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Column(children: <Widget>[
                        new MainMenuEntry("Routenplaner","/shoolPathFinder/main"),
                        new MainMenuEntry("Stundenplan","/404"),
                        new MainMenuEntry("News","/404")
                      ],)
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
