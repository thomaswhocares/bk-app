//system
import 'package:flutter/material.dart';
//views
import 'package:bkapp/views/home_page/body.dart' as Homepage;
import 'package:bkapp/views//schoolPathFinder_page/body.dart'
    as SchoolPathFinder;
//utils
import 'package:bkapp/utils/colorManager.dart';

ColorManager colorManager;

void main() {
  colorManager = new ColorManager();
  runApp(new MaterialApp(
    home: Homepage.Body(colorManager),
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
