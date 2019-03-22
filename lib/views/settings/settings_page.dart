import 'package:bkapp/logic/settings/theme/theme_bloc.dart';
import 'package:bkapp/logic/settings/theme/theme_change_event.dart';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bkapp/logic/singleton.dart' as Singletons;

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.settingsView,
      //Common Page ist bereits eine Spallte deswegen kommen nurnoch reihen und andere objekte dazu
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Themes",
                  style: TextStyle(fontSize: 23),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("Light Theme"),
                    onPressed: () {
                      BlocProvider.of<ThemeBloc>(context)
                          .dispatch(ChangeLightTheme());
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Dark Theme",
                    ),
                    onPressed: () {
                      BlocProvider.of<ThemeBloc>(context)
                          .dispatch(ChangeDarkTheme());
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: RaisedButton(
              child: Text("APP Speicher löschen"),
              onPressed: () {
                Singletons.SharedPreferenceProvider().sharedPreferences.clear();
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            )),
          ],
        )
      ],
    );
  }
}
