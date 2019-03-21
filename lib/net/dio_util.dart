import 'dart:io';

import 'package:clover/entity/net/base_resp.dart';
import 'package:clover/entity/user/user.dart';
import 'package:clover/net/api_urls.dart';
import 'package:clover/net/api_code.dart';
import 'package:clover/util/log_util.dart';
import 'package:clover/util/user_util.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class DioUtil {
  static DioUtil _instance;
  Dio _dio;
  Options _options;

  DioUtil() {
    _options = Options(
        baseUrl: ApiUrls.BASE_URL,
        connectTimeout: 8000,
        receiveTimeout: 3000,
        // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
      contentType: new ContentType('application', 'x-www-form-urlencoded',charset: 'utf-8'),
    );
    _dio = new Dio(_options);
  }

   void setCookie(String account, String psw){
    _dio.interceptor.request.onSend = (Options options){
//      User user = UserUtil.getUser();
//      String account = user.username;
//      String psw = user.password;
//      print('dioUtil cookie:'+user.toString());
//      options.headers['Cookie'] = 'loginUserPassword=19871125; loginUserName_wanandroid_com=cindy168; token_pass_wanandroid_com=3f4b91304bd60c2cdc3916275e284bf7; JSESSIONID=F2E70527D4F856F616DF345C7049C495';
      options.headers['Cookie'] = 'loginUserPassword=$psw; loginUserName_wanandroid_com=$account;';
      return options;
    };
  }

  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = new DioUtil();
    }
    return _instance;
  }

  //wanandroid接口使用，
  void getWanAndroid(url, OnDataReceCallback callback, {data, option, cancelToken}) async {
    print("dio url:$url");
    Response resp;
    try{
      resp = await _dio.get(url, data: data, options:option, cancelToken: cancelToken);
      print(resp.data);
      onRespRece(resp.data, callback);
    }on DioError catch(e){
      print(e);
    }
  }

  //普通的get方法
  void get(url, OnDataReceCallback callback, {data, option, cancelToken}) async {
    Response resp;
    try{
      resp = await _dio.get(url, data: data, options:option, cancelToken: cancelToken);
      print(resp.data);
      callback(resp.data);
    }on DioError catch(e){
      print(e);
    }
  }

  //wanandroid接口
  void postWanAndroid(String url, OnDataReceCallback callback, {data, option, cancelToken}) async{
    LogUtil.log('url: $url');
    LogUtil.log('params: $data');
    Response resp;
    try{
      resp = await _dio.post(url, data: data, options:option, cancelToken: cancelToken);
      print(resp.data);
      onRespRece(resp.data, callback);
    }on DioError catch(e){
      print(e);
    }
  }

  //解析wanandroid接口返回的数据
  void onRespRece(Map<String, dynamic> json, OnDataReceCallback callback){
    BaseResp resp = BaseResp.fromJson(json);
    if(resp.errorCode == ApiCode.SUCCEED){
      //返回的json中的data数据
      callback(json['data']);
    }else{
      print(resp.errorMsg);
    }
  }
}

typedef OnDataReceCallback = void Function(dynamic json);
