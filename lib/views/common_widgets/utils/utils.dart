import 'package:flutter/material.dart';

Widget conditionalWidget({Widget widget,@required bool contition()}) {
    if (contition()) {
      return widget;
    }else{
      return Container();
    }
}

