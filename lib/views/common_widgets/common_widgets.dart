import 'package:flutter/material.dart';
import 'package:bkapp/views/common_widgets/utils/utils.dart';

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
enum ViewType { settingsView, profileView, homepage, blank, bildungsbereiche }
/* Settings und profile view haben besonderheiten beim Header, blank homepage und bildungsbereiche sind noch gleich*/

class CommonPageCollumStyle extends StatelessWidget {
  final List<Widget> children;
  final ViewType viewType;
  const CommonPageCollumStyle(
      {Key key, this.viewType = ViewType.blank, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //BackButton
          floatingActionButton: conditionalWidget(
            contition: () {
              if (viewType != ViewType.homepage &&
                  viewType != ViewType.profileView &&
                  viewType != ViewType.settingsView) {
                return true;
              } else {
                return false;
              }
            },
            widget: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: TopMenuBar(viewType: this.viewType)),
              Expanded(
                child: Column(children: children),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopMenuBar extends StatelessWidget {
  final String _settingsRouteString = "/settings_page";
  final String _profileRouteString = "/profile";
  final ViewType viewType;
  TopMenuBar({Key key, this.viewType = ViewType.blank}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        settingsButton(context, viewType, _settingsRouteString),
        Text(viewType.toString()),
        profileButton(context, viewType, _profileRouteString)
      ],
    );
  }

  RaisedButton settingsButton(
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

  RaisedButton profileButton(
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
