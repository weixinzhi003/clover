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

  /**
   * 删除一个 Todo
   * 方法：POST
      参数：
      id: 拼接在链接上，为唯一标识
   */
  static void deleteTodo(int id, OnDataReceCallback callback){
    String url = ApiUrls.delelteTodo(id);
    DioUtil.getInstance().postWanAndroid(url, callback,);
  }

  /**
   * 仅更新完成状态Todo
   * 方法：POST
      参数：
      id: 拼接在链接上，为唯一标识
      status: 0或1，传1代表未完成到已完成，反之则反之。
   */
  static void doneTodo(int id, int status, OnDataReceCallback callback){
    String url = ApiUrls.doneTodo(id);
    Map<String, dynamic> params = new Map();
    params['status'] = status;

    DioUtil.getInstance().postWanAndroid(url, callback, data: params);
  }


  static void updateTodo(){

  }
}