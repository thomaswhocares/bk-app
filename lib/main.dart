//system
import 'package:flutter/material.dart';
//views
import 'package:bkapp/views/home_page/body.dart' as Homepage;
import 'package:bkapp/views//schoolPathFinder_page/body.dart'
    as SchoolPathFinder;
//utils

void main() {
  runApp(new MaterialApp(
    title: "BK GUT App",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 32, 21, 43),
        primaryColor: Color.fromARGB(255, 226, 0, 122),
        accentColor: Color.fromARGB(255, 58, 58, 59),
        primaryTextTheme:
            TextTheme(body1: TextStyle(fontSize: 20, color: Colors.white))),
    home: Homepage.Body(),
    routes: <String, WidgetBuilder>{
      "/shoolPathFinder/main": (BuildContext context) =>
          new SchoolPathFinder.Body(),
      "/404": (BuildContext context) => new ErrorPage()
    },
  ));
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("NICHT DA");
  }
}
