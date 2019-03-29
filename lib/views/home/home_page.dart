//system
import 'package:bkapp/logic/bildungsuebersicht/bildungsuebersicht_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkapp/views/common_widgets/common_widgets.dart'
    as CommonWidgets;

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.CommonPageCollumStyle(
      viewType: CommonWidgets.ViewType.homepage,
      children: <Widget>[
        Expanded(
          child: Column(children: <Widget>[
            //Obere menü buttons;
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return RaisedButton(
                    //We do not need inner padding
                    padding: EdgeInsets.all(0),
                    splashColor: Colors.white,
                    elevation: 0,
                    
                    shape:
                        CircleBorder(side: BorderSide(style: BorderStyle.none)),
                    onPressed: () {},
                    child: Container(
                      width: constraints.maxHeight,
                      height: constraints.maxHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/gut_logo.svg',
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                BlocBuilder(
                  bloc: BlocProvider.of<BildungsuebersichtBloc>(context),
                  builder:
                      (BuildContext context, BildungsuebersichtState state) {
                    // Bildungsübersicht SplashScreen wird nicht verlinkt wenn dontShowAgain true
                    return state.dontShowAgain == true
                        ? CommonWidgets.menuButtonNavigator(
                            context: context,
                            text: Text("Bildungsübersicht"),
                            stringRouteName: "/bildungsuebersicht",
                          )
                        : CommonWidgets.menuButtonNavigator(
                            context: context,
                            text: Text("Bildungsübersicht"),
                            stringRouteName: "/bildungsübersichtSpash",
                          );
                  },
                ),
                CommonWidgets.menuButtonNavigator(
                  context: context,
                  text: Text("Debug link (/bildungsübersichtSplash)"),
                  stringRouteName: "/bildungsübersichtSpash",
                ),
                CommonWidgets.menuButtonNavigator(
                  context: context,
                  text: Text("Kontakt"),
                ),
                CommonWidgets.menuButtonNavigator(
                  context: context,
                  text: Text("News"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
