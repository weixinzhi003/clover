import 'package:clover/page/user/todo/todo_home.dart';
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

  @override
  void initState() {
    super.initState();
    this.type = this.widget.type;
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
//    type = TodoTypeContext.of(context).curTodoType;
    return Container(
      child: Text('未完成:type=$type'),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
