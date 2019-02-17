import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  void onClick() {}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SafeArea(
      child: new Container(
        child: new Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: new Column(
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        splashColor: Colors.purpleAccent,
                        iconSize: 70,
                        onPressed: onClick,
                    ),
                    new Expanded(child:IconButton(
                        icon: new Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        splashColor: Colors.purpleAccent,
                        iconSize: 120,
                        onPressed: onClick,
                      )
                    ),
                    new IconButton(
                        icon: new Icon(
                          ,
                          color: Colors.black,
                        ),
                        splashColor: Colors.purpleAccent,
                        iconSize: 70,
                        onPressed: onClick,
                      ),
                  ],
                ),
                new Row(),
                new Row()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
