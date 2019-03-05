import 'package:clover/entity/net/page.dart';
import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/page/user/todo/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

class TodoUnfinishedList extends StatefulWidget {

  int type;

  TodoUnfinishedList(this.type);

  @override
  _TodoUnfinishedListState createState() => _TodoUnfinishedListState();
}

class _TodoUnfinishedListState extends State<TodoUnfinishedList> with AutomaticKeepAliveClientMixin{

  int type = 0;
  int curPage = 0;
  List<TodoInfo> todoInfoList = [];

  bool isLoading;
  Page page;

  @override
  void initState() {
    super.initState();
    this.type = this.widget.type;
    eventBus.on<OnTodoTypeChangedEvent>().listen((event){
      if(mounted){
        setState(() {
          type = event.todoType;
        });
        print("type:$type");
        queryData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text('未完成:type=$type'),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index){
            return TodoItem(todoInfoList[index]);
          }, itemCount: todoInfoList.length,),
        )
      ],
    );
    return ListView.builder(itemBuilder: (context, index){
      return TodoItem(todoInfoList[index]);
    }, itemCount: todoInfoList.length,);
  }

  void queryData() {
//    String url = 'http://www.wanandroid.com/lg/todo/v2/list/$curPage/json?status=0&type=$type';
    String url = 'http://www.wanandroid.com/lg/todo/v2/list/1/json?status=0&type=0';
    DioUtil.getInstance().getWanAndroid(
        url, (json) {
      print(json);
          Page page = Page.fromJson(json);
      curPage = page.curPage;
      List<TodoInfo> newData = page.datas.map((todoInfoJson){
        return TodoInfo.fromJson(todoInfoJson);
      }).toList();
      setState(() {
        todoInfoList.addAll(newData);
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
