class ApiUrls{

  static const BASE_URL = 'https://www.wanandroid.com';

  //1.2首页banner
  static const BANNERS = '/banner/json';

  //5.登录与注册
  //5.1登录
  static const LOGIN = '/user/login';

  //5.2注册
  static const REGISTER = '/user/register';

  //5.3退出
  static const LOGOUT = '/user/logout/json';

  //8 TODO工具
  //8.1 新增一个TODO
  static const ADD_TODO = 'http://www.wanandroid.com/lg/todo/add/json';

  //8.2 更新一个TODO
  static String updateTodo(int id){
    return 'http://www.wanandroid.com/lg/todo/update/$id/json';
  }

  //8.3 删除一个TODO
  static String delelteTodo(int id){
    return 'http://www.wanandroid.com/lg/todo/delete/$id/json';
  }

  //8.4 仅更新完成状态Todo
  static String doneTodo(int id){
    return 'http://www.wanandroid.com/lg/todo/done/$id/json';
  }

  //8.5 TODO列表
  static String todoList(int page){
    return 'http://www.wanandroid.com/lg/todo/v2/list/$page/json';
  }
}

class GankApiUrls{
  static const int GANK_API_PAGE_COUNT = 10;

//  static const String CHANNEL_NEWS_LIST = 'http://gank.io/api/data/$channelParam/$pageSize/$targetPage';

  static String buildChannelNewsListUrl(String channelName, int pageIndex, {int pageCount}){
    int count = pageCount == null ? GANK_API_PAGE_COUNT : pageCount;
    return 'http://gank.io/api/data/$channelName/$count/$pageIndex';
  }
}


