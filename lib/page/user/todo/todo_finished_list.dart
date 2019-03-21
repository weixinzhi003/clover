import 'package:clover/entity/net/page.dart';
import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/page/user/todo/todo_finished_item.dart';
import 'package:clover/page/user/todo/todo_unfinished_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';


class TodoFinishedList extends StatefulWidget {

  int type;

  TodoFinishedList(this.type);

  @override
  TodoFinishedListState createState() => TodoFinishedListState();
}

class TodoFinishedListState extends State<TodoFinishedList> {
  int type = 0;
  int curPage = 0;
  List<TodoInfo> todoInfoList = [];

  bool isLoading = false;
  Page curPageInfo = new Page(over: false);

  ScrollController scrollController = ScrollController();
  CancelToken cancelToken = new CancelToken();

  @override
  void initState() {
    super.initState();
    initData(this.widget.type);
    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        queryData();
      }
    });
    eventBus.on<OnTodoTypeChangedEvent>().listen((event) {
      if (mounted) {
        initData(event.todoType);
      }
    });
    //todo状态改变时刷新列表
    eventBus.on<OnTodoStatusChangedEvent>().listen((event){
      if(mounted){
        initData(type);
      }
    });
    //监听删除todo事件
    eventBus.on<OnTodoDeleteEvent>().listen((event){
      if (mounted) {
        initData(type);
      }
    });
  }

  void initData(int type) {
    this.type = type;
    curPage = 0;
    isLoading = false;
    curPageInfo = new Page(over: false);
    queryData();
  }

  @override
  Widget build(BuildContext context) {
    return buildContentWidget();
  }

  Widget buildContentWidget(){
    if(todoInfoList.isEmpty){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/data_empty.png", width: 140,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('暂无数据', style: TextStyle(color: Colors.grey, fontSize: 16),),
          )
        ],
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return buildTodoItem(index);
        },
        itemCount: todoInfoList.length,
        controller: scrollController,
      );
    }
  }

  void queryData() {
//    String url = 'http://www.wanandroid.com/lg/todo/v2/list/$curPage/json?status=0&type=$type';
    if (isLoading || curPageInfo.over) {
      return;
    }
    int targetPageIndex = curPage + 1;
    int status = getTodoInfoStatus();
    String url =
        'http://www.wanandroid.com/lg/todo/v2/list/$targetPageIndex/json?status=$status&type=$type';
    DioUtil.getInstance().getWanAndroid(url, (json) {
      curPageInfo = Page.fromJson(json);
      curPage = curPageInfo.curPage;
      List<TodoInfo> newData = curPageInfo.datas.map((todoInfoJson) {
        return TodoInfo.fromJson(todoInfoJson);
      }).toList();
      //如果是第一页，则清除旧数据
      setState(() {
        if (curPage == 1) {
          todoInfoList.clear();
        }
        todoInfoList.addAll(newData);
      });
    }, cancelToken: cancelToken);
  }

  @override
  void dispose() {
    cancelToken.cancel('cancelled');
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;


  int getTodoInfoStatus(){
    return TodoInfo.STATUS_DONE;
  }

  Widget buildTodoItem(int index){
    return TodoFinishedItem(todoInfoList[index]);
  }

}
