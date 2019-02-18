import 'home_page/body.dart' as Homepage;
import 'package:bkapp/schoolPathFinder_page/body.dart' as SchoolPathFinder;
import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(
    home: Homepage.Body(),
    routes: <String,WidgetBuilder>{
      "/shoolPathFinder/main": (BuildContext context) => new SchoolPathFinder.Body(),
      "/404": (BuildContext context) => new ErrorPage()
    },
  ));
}




class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("NICHT DA");
  }
}