import 'package:flutter/material.dart';

/*
class CommonPage extends StatelessWidget {

  Widget child;
  CommonPage(this.child);

  Widget build(BuildContext context) {
    // TODO: implement build
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
class CommonPage extends StatelessWidget {
  final Widget child;
  const CommonPage({Key key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: child
        ),
      ),
    );
  }
}

class TopMenuBar extends StatelessWidget {
  final String _settingsRouteName = "/settings_page";
  final String _profileRouteName = "/profile";
  TopMenuBar({Key key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
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
