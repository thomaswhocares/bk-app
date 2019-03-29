import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bkapp/logic/bildungsuebersicht/bildungsuebersicht_bloc.dart';

class BildungsuebersichtSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Hi",
                  textScaleFactor: 5,
                ),
              ),
              Text(
                "Was interessiert dich ?",
                textScaleFactor: 2,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CommonWidgets.menuButtonNavigator(
                    context: context,
                    text: Text("Nur relavante Bildungsangebote"),
                    outerPadding: EdgeInsets.all(0)),
                CommonWidgets.menuButtonNavigator(
                    context: context,
                    text: Text("Alle Bildungsangebote"),
                    stringRouteName: "/bildungsuebersicht",
                    outerPadding: EdgeInsets.all(0)),
                Row(
                  children: <Widget>[ShowAgainToggle()],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ShowAgainToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<BildungsuebersichtBloc>(context),
      builder: (BuildContext context, BildungsuebersichtState state) {
        return RaisedButton(
          shape: Border.all(color: Colors.transparent),
          onPressed: () {
            BlocProvider.of<BildungsuebersichtBloc>(context)
                .dispatch(BildungsuebersichtToggleShowAgain());
          },
          child: Row(
            children: <Widget>[
              IgnorePointer(
                child: Checkbox(
                  value: state.dontShowAgain,
                  tristate: false,
                  onChanged: (bool changed) {},
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                ),
              ),
              Text("Nicht nochmal fragen.")
            ],
          ),
        );
      },
    );
  }
}