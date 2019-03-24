import 'package:flutter/material.dart';
import 'dart:core';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;

class Bildungsuebersicht extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> bildungsgangNames = [
      'Hauptschulabschluss nach Klasse 9',
      'Hauptschulabschluss nach Klasse 10',
      'Fachoberschulreife (FOR)',
      'Fachhochschulreife (FHR)',
      'Fachabitur',
      'Allgemeine Hochschulreife (AHR)',
      'Abitur',
      'Techniker (staatlich geprüfter Techniker)'
    ];

    return CommonWidgets.CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: bildungsgangNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      color: Colors.black38,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(bildungsgangNames[index])
                              ],
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxWidth/6,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 900,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Text("heh ");
                                      }),
                                );
                              },
                            ),
                            /**/
                          ],
                        ),
                      )));
            },
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Container(
                            color: Theme.of(context).hintColor,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Text("Bildungsgänge:"),
                            ),
                          ),
                        ),
                        _tagBubble(
                            context, Colors.orangeAccent, "end mdsfdsfsdfde")
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Themenbereiche"),
                      )
                    ],
                  ))
                ],
              ),
            )),
      ],
    );
  }

  Widget _tagBubble(
    BuildContext context,
    Color color,
    String text,
  ) {
    Text textWidget = new Text(
      text,
      style: TextStyle(
        color: Theme.of(context).backgroundColor,
      ),
      textAlign: TextAlign.center,
    );

    return FlatButton(
      color: color,
      disabledColor: Colors.grey,
      onPressed: () {},
      child: textWidget,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200))),
    );
  }
}
