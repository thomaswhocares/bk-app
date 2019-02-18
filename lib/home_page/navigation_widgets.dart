import 'package:flutter/material.dart';

class MainMenuEntry extends StatelessWidget{

  String text ;
  String route;

  MainMenuEntry(String text, String route){
    this.text = text;
    this.route = route;
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            onPressed: () {Navigator.of(context).pushNamed(route);},
            child: Padding(padding: EdgeInsets.fromLTRB(0, 20, 2, 20),
              child: new Text(
                text,
                style: TextStyle(fontSize: 32),
              ),),
          ),
        )
      ],
    );
  }
}
