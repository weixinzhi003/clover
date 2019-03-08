import 'package:clover/entity/net/page.dart';
import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/page/user/todo/todo_unfinished_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

class BaseTodoList extends StatefulWidget {
  int type;

  BaseTodoList(this.type);

  @override
  BaseTodoListState createState() => BaseTodoListState();
}

class BaseTodoListState extends State<BaseTodoList>
    with AutomaticKeepAliveClientMixin {
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
    return ListView.builder(
      itemBuilder: (context, index) {
        return buildTodoItem(index);
      },
      itemCount: todoInfoList.length,
      controller: scrollController,
    );
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
      print(json);
      curPageInfo = Page.fromJson(json);
      curPage = curPageInfo.curPage;
      List<TodoInfo> newData = curPageInfo.datas.map((todoInfoJson) {
        return TodoInfo.fromJson(todoInfoJson);
      }).toList();
      //如果是第一页，则清除旧数据
      if (curPage == 1) {
        todoInfoList.clear();
      }
      todoInfoList.addAll(newData);
      setState(() {});
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
    return TodoInfo.STATUS_UNDONE;
  }

  Widget buildTodoItem(int index){
    return TodoUnfinishedItem(todoInfoList[index]);
  }
}
