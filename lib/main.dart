//
// http://thetechnocafe.com/just-enough-dart-for-flutter-tutorial-01-variables-types-and-functions/
// ist ein gutes Tutorial um mal mit dem ganzen scheiß anzufangen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bkapp/logic/theme/theme_bloc.dart';
import 'package:bkapp/logic/theme/theme_state.dart';
import 'package:bkapp/views/home_page/home_page.dart';

void main() => runApp(TopBlocProvider(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: state.themeData,
            home: Homepage(),
            routes: <String, WidgetBuilder>{
              "/shoolPathFinder/main": (BuildContext context) =>
                  new ErrorPage(),
              "/settings_page": (BuildContext context) => new ErrorPage(),
              "/profile" : (BuildContext context) => new ErrorPage(),
              "/404": (BuildContext context) => new ErrorPage()
            });
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("NICHT DA");
  }
}

//---------------------Adds a top level widget that allows themeState----------------------------
class TopBlocProvider extends StatefulWidget {
  final Widget child;

  TopBlocProvider(this.child);
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
