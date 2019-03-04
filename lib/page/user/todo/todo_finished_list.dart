import 'package:clover/net/dio_util.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';


class TodoFinishedList extends StatefulWidget {

  int type;

  TodoFinishedList(this.type);

  @override
  _TodoFinishedListState createState() => _TodoFinishedListState();
}

class _TodoFinishedListState extends State<TodoFinishedList> with AutomaticKeepAliveClientMixin{

  int type = 0;

  @override
  void initState() {
    super.initState();
    type = this.widget.type;
    eventBus.on<OnTodoTypeChangedEvent>().listen((event){
      if(mounted){
        setState(() {
          type = event.todoType;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('已完成:type=$type'),
    );
  }

  void queryData() {
    String url = 'http://www.wanandroid.com/lg/todo/v2/list/$type/json';
    DioUtil.getInstance().getWanAndroid(
        url, (json) {
      print(json);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
