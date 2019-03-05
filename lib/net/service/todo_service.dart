import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/api_urls.dart';
import 'package:clover/net/dio_util.dart';

class TodoService{

  /**
   * 新增一个TODO
   */
  static void addTodo(TodoInfo info, int type, OnDataReceCallback callback){
    Map<String, dynamic> params = new Map();
    params['title'] = info.title;
    params['content'] = info.content;
    params['date'] = info.completeDateStr;
    params['type'] = type;

    print(params);

    DioUtil.getInstance().postWanAndroid(ApiUrls.ADD_TODO, callback, data: params);
  }
}