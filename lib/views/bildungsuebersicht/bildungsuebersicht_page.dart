import 'package:flutter/material.dart';
import 'dart:core';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;

class Bildungsuebersicht extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bildungsGaenge = Map();

    var bubble1 =Map();

    bildungsGaenge[0] = {
      'name': 'Hauptschulabschluss nach Klasse 9',
      bubble1[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      
    };
    bildungsGaenge[1] = {
      'name': 'Hauptschulabschluss nach Klasse 10',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[2] = {
      'name': 'Fachoberschulreife (FOR)',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[3] = {
      'name': 'Fachhochschulreife (FHR)',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[4] = {
      'name': 'Fachabitur',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[5] = {
      'name': 'Allgemeine Hochschulreife (AHR)',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[6] = {
      'name': 'Abitur',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };
    bildungsGaenge[6] = {
      'name': 'Techniker (staatlich geprüfter Techniker)',
      'bubble'[0]: {
        'text' : "Technik",
        'color': Colors.blue,
      },
      'bubble'[1]: {
        'text' : "Gestaktung",
        'color': Color.fromARGB(255, 226, 0, 122),
      }
    };

    return CommonWidgets.CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: bildungsGaenge.length,
            itemBuilder: (BuildContext context, int indexBildungsgang) {
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
                                Text(bildungsGaenge[indexBildungsgang]['name'])
                              ],
                            ),
                            LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxWidth / 6,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: bildungsGaenge[indexBildungsgang][bubble1].length,
                                      itemBuilder:
                                          (BuildContext context, int indexBubble) {
                                        return Container(child: Text(bildungsGaenge[indexBildungsgang]['bubble'[indexBubble]]['text']),);
                                      }),
                                );
                              },
                            ),
                            
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
