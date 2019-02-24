//
// http://thetechnocafe.com/just-enough-dart-for-flutter-tutorial-01-variables-types-and-functions/
// ist ein gutes Tutorial um mal mit dem ganzen scheiß anzufangen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bkapp/logic/theme/theme_bloc.dart';
import 'package:bkapp/logic/theme/theme_state.dart';
import 'package:bkapp/views/home_page/homepage.dart';

void main() => runApp(RootWidget());

class RootWidget extends StatefulWidget {
  RootWidget({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => RootWidgetState();
}

class RootWidgetState extends State<RootWidget> {
  final _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _themeBloc,
        child: Test());
  }

  @override
  void dispose() {
    _themeBloc.dispose();
    super.dispose();
  }
}

class Test extends StatelessWidget{
  const Test ({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder(
            bloc: BlocProvider.of<ThemeBloc>(context),
            builder: (context, ThemeState state) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: state.themeData,
                home: Homepage(),
              );
            });
  }

}