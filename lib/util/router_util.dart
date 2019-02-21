import 'package:flutter/material.dart';

class RouterUtil{
  static void openRouter(BuildContext context, Widget widget){
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return widget;
    }));
  }

  static void back(BuildContext context){
    Navigator.of(context).pop();
  }
}