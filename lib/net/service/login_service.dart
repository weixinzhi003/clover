import 'package:clover/net/api_urls.dart';
import 'package:clover/net/dio_util.dart';

class LoginService{

  static void login(String username, String psw, OnDataReceCallback callback){
    Map<String, String> params = new Map();
    params['username'] = username;
    params['password'] = psw;

    DioUtil.getInstance().postWanAndroid(ApiUrls.LOGIN, callback, data: params);
  }

  static void register(String username, String psw, String repsw, OnDataReceCallback callback){
    Map<String, String> params = new Map();
    params['username'] = username;
    params['password'] = psw;
    params['password'] = repsw;

    DioUtil.getInstance().get(ApiUrls.REGISTER, callback, data: params);
  }

  static void logout(OnDataReceCallback callback){
    DioUtil.getInstance().get(ApiUrls.LOGOUT, callback);
  }
}