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
enum ViewType { settingsView, profileView, homepage, blank,bildungsbereiche }
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
  final String _settingsRouteName = "/settings_page";
  final String _profileRouteName = "/profile";
  final ViewType viewType;
  TopMenuBar({Key key, this.viewType = ViewType.blank}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (viewType) {
      case ViewType.settingsView:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            //Profile Button
            Text(viewType.toString()),
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: null,
            ),
          ],
        );
        break;
      case ViewType.profileView:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: null,
            ),
            //Profile Button
            Text(viewType.toString()),
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
        break;
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(_settingsRouteName);
              },
            ),
            Text(viewType.toString()),
            //Profile Button
            RaisedButton(
              shape: CircleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Theme.of(context).primaryColor)),
              color: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.account_circle,
                color: Theme.of(context).primaryColor,
              ),
              splashColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(_profileRouteName);
              },
            ),
          ],
        );
    }
  }

  
}
