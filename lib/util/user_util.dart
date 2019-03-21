import 'package:clover/entity/user/user.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/util/log_util.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/util/sp/sp_keys.dart';
import 'package:clover/util/sp/sp_util.dart';
import 'package:clover/util/text_util.dart';
import 'dart:convert';
import 'package:clover/event/customer_event.dart';
import 'package:clover/util/toast_util.dart';
import 'package:flutter/material.dart';

class UserUtil{

  static User _user = null;

  static void init(){
    SpUtil.getString(SpKeys.LOGIN_USER).then((String value){
      if(!TextUtil.isEmpty(value)){
        Map<String, dynamic> map = json.decode(value);
        _user = User.fromJson(map);
        DioUtil.getInstance().setCookie(_user.username, _user.password);
      }
    });
  }

  static User getUser(){
    return _user;
  }

  static Future<User> getUserFuture() async{
    if(_user == null){
      return SpUtil.getString(SpKeys.LOGIN_USER).then((String value){
        if(!TextUtil.isEmpty(value)){
          Map<String, dynamic> map = json.decode(value);
          _user = User.fromJson(map);
          return _user;
        }
      });
    }else{
      return Future.value(_user);
    }
  }

  static bool isLogin(){
    return _user != null;
  }

  static void setLoginUser(User user){
    _user = user;
    if(user == null){
      SpUtil.setString(SpKeys.LOGIN_USER, "");
      DioUtil.getInstance().setCookie("", "");
    }else{
      SpUtil.setString(SpKeys.LOGIN_USER, user.toString());
      DioUtil.getInstance().setCookie(_user.username, _user.password);
    }
  }

  static void onLogin(BuildContext context, User user){
    user.avatar = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552911474661&di=b71b4343cfb1c3be7a302599e44d1fee&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201508%2F03%2F20150803144554_cj5CE.jpeg';
    user.fansCount = 8848;
    user.followCount = 168;
    user.favoriteCount = 820;
    setLoginUser(user);
    eventBus.fire(OnLoginStatusChangedEvent(user));
    ToastUtil.show(context, "登录成功");
  }

  //退出登录
  static void onLogout(BuildContext context){
    setLoginUser(null);
    eventBus.fire(OnLoginStatusChangedEvent(null));
    RouterUtil.back(context);
  }
}