import 'package:flutter/material.dart';
import 'dart:io' show Platform;

/*
class CommonPage extends StatelessWidget {

  Widget child;
  CommonPage(this.child);

  Widget build(BuildContext context) {
    // implement build
    return BlocBuilder(
      bloc: BlocProvider.of<ThemeBloc>(context),
      builder: (context, ThemeState state) { 
        return Container(
          color: state.themeData.backgroundColor,
          child: child
        );
        }
    );
  }
}
*/
enum ViewType { settingsView, profileView, homepage, blank, bildungsuebersicht }
/* Settings und profile view haben besonderheiten beim Header, blank homepage und bildungsbereiche sind noch gleich*/

class CommonPageCollumStyle extends StatelessWidget {
  final List<Widget> children;
  final ViewType viewType;
  const CommonPageCollumStyle(
      {Key key, this.viewType = ViewType.blank, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List widget zu welchem alle child widgets hinzugefügt werden welche übergeben werden.
    List<Widget> pageContent = [];

    //Header Bar
    pageContent.add(Padding(
        //style
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        //Header Bar
        child: _TopMenuBar(viewType: this.viewType)));

    // Die children aus der jeweiligen ansicht.
    pageContent.addAll(children);

    // zeug was auf jeder seite gebraucht wird um eine Seite anzuzeigen + pageContent
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // In den Floating action button wird ein Widget gepackt welches einen zurück button beinhaltet
          // und die logic (contition) um diesen nur an bestimmten stellen anzuzeigen.
          floatingActionButton: _conditionalWidget(
            contition: () {
              if (viewType != ViewType.homepage &&
                  viewType != ViewType.profileView &&
                  viewType != ViewType.settingsView &&
                  Platform.isIOS) {
                //button wird angezeigt
                return true;
              } else {
                //button wird ausgeblended
                return false;
              }
            },
            //zurück button
            widget: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(children: pageContent),
        ),
      ),
    );
  }
}

class _TopMenuBar extends StatelessWidget {
  final String _settingsRouteString = "/settings_page";
  final String _profileRouteString = "/profile";
  final ViewType viewType;
  _TopMenuBar({Key key, this.viewType = ViewType.blank}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _settingsButton(context, viewType, _settingsRouteString),
        Text(viewType.toString()),
        _profileButton(context, viewType, _profileRouteString)
      ],
    );
  }

  //private
  RaisedButton _settingsButton(
      BuildContext context, ViewType viewType, String settingsRouteString) {
    VoidCallback onClick;
    Icon icon = Icon(
      Icons.menu,
      color: Theme.of(context).primaryColor,
    );
    switch (viewType) {
      case ViewType.settingsView:
        onClick = () {
          Navigator.of(context).pop();
        };
        //override
        icon = Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        );
        break;
      case ViewType.profileView:
        onClick = null;
        break;
      default:
        onClick = () {
          Navigator.of(context).pushNamed(settingsRouteString);
        };
    }
    return RaisedButton(
        shape: CircleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                color: Theme.of(context).primaryColor)),
        color: Theme.of(context).backgroundColor,
        child: icon,
        splashColor: Theme.of(context).primaryColor,
        onPressed: onClick);
  }

  //private
  RaisedButton _profileButton(
      BuildContext context, ViewType viewType, String profileRouteString) {
    VoidCallback onClick;
    Icon icon = Icon(
      Icons.account_circle,
      color: Theme.of(context).primaryColor,
    );
    switch (viewType) {
      case ViewType.profileView:
        onClick = () {
          Navigator.of(context).pop();
        };
        //override
        icon = Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        );
        break;
      case ViewType.settingsView:
        onClick = null;
        break;
      default:
        onClick = () {
          Navigator.of(context).pushNamed(profileRouteString);
        };
    }
    return RaisedButton(
        shape: CircleBorder(
            side: BorderSide(
                style: BorderStyle.solid,
                color: Theme.of(context).primaryColor)),
        color: Theme.of(context).backgroundColor,
        child: icon,
        splashColor: Theme.of(context).primaryColor,
        onPressed: onClick);
  }
}

Widget _conditionalWidget({Widget widget, @required bool contition()}) {
  if (contition()) {
    return widget;
  } else {
    return Container();
  }
}

Widget menuEntry(
    {@required BuildContext context,
    String stringRouteName = "/404",
    Text text}) {
  if (text == null) {
    text = Text("--- NOT SET ---");
  }
  return new Row(
    children: <Widget>[
      Expanded(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(stringRouteName);
          },
          child: text,
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Colors.transparent,
          color: Theme.of(context).backgroundColor,
        ),
      ),
    ],
  );
}
