//
// http://thetechnocafe.com/just-enough-dart-for-flutter-tutorial-01-variables-types-and-functions/
// ist ein gutes Tutorial um mal mit dem ganzen scheiß anzufangen

import 'package:bkapp/views/common_widgets/common_widgets.dart';
import 'package:bkapp/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bkapp/logic/theme/theme_bloc.dart';
import 'package:bkapp/logic/theme/theme_state.dart';
import 'package:bkapp/views/home/home_page.dart';
import 'package:bkapp/views/settings/settings_page.dart';
import 'package:bkapp/views/bildungsuebersicht/bildungsuebersicht_page.dart';
import 'package:bkapp/logic/singleton.dart';

void main() async{
  await SharedPreferenceProvider().init();
  runApp(TopBlocProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) {
        if (state.themeData.brightness == Brightness.dark) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: state.themeData.backgroundColor,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: state.themeData.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: state.themeData.backgroundColor,
          ));
        } else {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: state.themeData.backgroundColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: state.themeData.backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: state.themeData.backgroundColor,
          ));
        }

        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.themeData,
          home: Homepage(),
          routes: <String, WidgetBuilder>{
            "/bildungsübersicht": (BuildContext context) =>
                new Bildungsuebersicht(),
            "/settings_page": (BuildContext context) => new SettingsPage(),
            "/profile": (BuildContext context) => new ProfilePage(),
            "/404": (BuildContext context) => new ErrorPage()
          },
        );
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text("ERROR PAGE 404"),
          ),
        )
      ],
    );
  }
}

//---------------------Adds a top level widget that allows themeState----------------------------
class TopBlocProvider extends StatefulWidget {
  final Widget child;

  TopBlocProvider({@required this.child});
  @override
  State<StatefulWidget> createState() => TopBlocProviderState(child);
}

class TopBlocProviderState extends State<TopBlocProvider> {
  Widget child;
  TopBlocProviderState(this.child);
  final _themeBloc = ThemeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(bloc: _themeBloc, child: child);
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    super.dispose();
  }
}
//-------------------------------------------------------------------
