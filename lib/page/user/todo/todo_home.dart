import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/event/customer_event.dart';
import 'package:clover/page/user/todo/submit_todo_page.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/widget/divider/divider.dart';
import 'package:flutter/material.dart';

import 'todo_finished_list.dart';
import 'todo_unfinished_list.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<TodoType> todoTypeList = [];

  /*static int curTodoType = 0;

  TodoUnfinishedList unfinishedList = TodoUnfinishedList(curTodoType);
  TodoFinishedList finishedList = TodoFinishedList(curTodoType);*/

  int curTodoType = 1;

  @override
  void initState() {
    super.initState();
    initTodoTypeList();
  }

  void initTodoTypeList() {
    todoTypeList.add(TodoTypes.work);
    todoTypeList.add(TodoTypes.study);
    todoTypeList.add(TodoTypes.life);
    todoTypeList.add(TodoTypes.ent);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('事项清单'),
          centerTitle: true,
        ),
        /*body: TodoTypeContext(
          curTodoType: curTodoType,
          child: Column(
            children: <Widget>[
              buildTodoType(),
              TabBar(
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.black45,
                tabs: <Widget>[Tab(text: '未完成'), Tab(text: '已完成')],
              ),
              LineDivider(),
              Expanded(
                child: TabBarView(
                  children: <Widget>[unfinishedList, finishedList,],
                ),
              ),
            ],
          ),
        ),*/
        body: Column(
          children: <Widget>[
            buildTodoType(),
            TabBar(
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black45,
              tabs: <Widget>[Tab(text: '未完成'), Tab(text: '已完成')],
            ),
            LineDivider(),
            Expanded(
              child: TabBarView(
                children: <Widget>[TodoUnfinishedList(curTodoType), TodoFinishedList(curTodoType),],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              RouterUtil.openRouter(context, SubmitTodoPage());
            }),
      ),
    );
  }

  Widget buildTodoType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: todoTypeList.map((TodoType type) {
        return buildTodoTypeItem(type);
      }).toList()),
    );
  }

  Widget buildTodoTypeItem(TodoType todoType) {
    Color textColor =
        todoType.type == curTodoType ? Colors.orange : Colors.grey;
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              color: textColor
            ),
            child: Center(
              child: Image.asset(
                todoType.typeIcon,
                width: 25,
                height: 25,
              ),
            ),
          ),
          Text(
            todoType.typeName,
            style: TextStyle(color: textColor),
          )
        ],
      ),
      onTap: () {
        onTypeTap(todoType);
      },
    );
  }

  void onTypeTap(TodoType todoType){
    setState(() {
      curTodoType = todoType.type;
      eventBus.fire(OnTodoTypeChangedEvent(curTodoType));
    });
  }
}

class TodoTypeContext extends InheritedWidget{

  int curTodoType;

  TodoTypeContext({
    Key key,
    this.curTodoType,
    @required Widget child,
  }) : super(key: key, child: child);

  static TodoTypeContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(TodoTypeContext);
  }

  @override
  bool updateShouldNotify(TodoTypeContext oldWidget) {
    return curTodoType != oldWidget.curTodoType;
  }

}