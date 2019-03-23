import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.profileView,
      //Common Page ist bereits eine Spallte deswegen kommen nurnoch reihen und andere objekte dazu
      children: <Widget>[
        Expanded(
          flex: 1,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return RaisedButton(
                //We do not need inner padding
                padding: EdgeInsets.all(0),
                shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
                onPressed: () {},
                child: Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("http://192.168.2.175/avatar.png"),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Bisheriger Abschluss:"),
                  ),
                  ButtonTest(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ButtonTest extends StatefulWidget {
  ButtonTest({Key key}) : super(key: key);

  _ButtonTestState createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> {
  var dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Hauptschulabschluss nach Klasse 9',
        'Hauptschulabschluss nach Klasse 10',
        'Fachoberschulreife (FOR)',
        'Fachhochschulreife (FHR)',
        'Fachabitur',
        'Allgemeine Hochschulreife (AHR)',
        'Abitur',
        'Techniker (staatlich geprüfter Techniker)',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
