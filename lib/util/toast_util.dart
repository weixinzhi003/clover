import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class ToastUtil{
  static void show(BuildContext context, String content){
    /*Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );*/
    Toast.show(content,context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }
}