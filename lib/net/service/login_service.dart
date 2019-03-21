import 'package:clover/net/api_urls.dart';
import 'package:clover/net/dio_util.dart';

class LoginService{

  static void login(String username, String psw, OnDataReceCallback callback){
    Map<String, String> params = new Map();
    params['username'] = username;
    params['password'] = psw;

    DioUtil.getInstance().postWanAndroid(ApiUrls.LOGIN, callback, data: params);
    //返回数据同注册
  }

  static void register(String username, String psw, OnDataReceCallback callback){
    Map<String, String> params = new Map();
    params['username'] = username;
    params['password'] = psw;
    params['repassword'] = psw;

    DioUtil.getInstance().postWanAndroid(ApiUrls.REGISTER, callback, data: params);
    //返回的数据
    /*{
      "data": {
    "chapterTops": [],
    "collectIds": [],
    "email": "",
    "icon": "",
    "id": 20402,
    "password": "",
    "token": "",
    "type": 0,
    "username": "cindy169"
    },
    "errorCode": 0,
    "errorMsg": ""
  }*/
  }

  static void logout(OnDataReceCallback callback){
    DioUtil.getInstance().get(ApiUrls.LOGOUT, callback);
  }
}