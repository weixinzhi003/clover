import 'package:clover/entity/todo/todo_info.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

class TestListView extends StatefulWidget {
  @override
  _TestListViewState createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {

  List<TodoInfo> dataList = [];
  String title = "";

  @override
  void initState() {
    super.initState();
    for(int i=1; i<=8; i++){
      TodoInfo info = TodoInfo(id: i, title: "这是标题$i");
      dataList.add(info);
    }
    eventBus.on<OnTodoDeleteEvent>().listen((event){
      TodoInfo todoInfo = event.todoInfo;
      print("eventBus.On TodoDeleteEvent  ${todoInfo.id}");
      setState(() {
        title = todoInfo.id.toString();
        for(int i=0; i<dataList.length; i++) {
          TodoInfo temp = dataList[i];
          if (temp.id == todoInfo.id) {
            dataList.removeAt(i);
            print("remove:$i");
            break;
          }
        }
        for(int i=0; i<dataList.length; i++){
          TodoInfo temp = dataList[i];
          print("after remove:temp$i:${temp.toJson()}");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return TestItem(dataList[index], removeItem);
      }, itemCount: dataList.length,),
    );
  }

  void removeItem(int id){
    setState(() {
      for(int i=0; i<dataList.length; i++) {
        TodoInfo temp = dataList[i];
        if (temp.id == id) {
          dataList.removeAt(i);
          print("remove:$i");
          break;
        }
      }
    });
  }


}

class TestItem extends StatefulWidget {

  TodoInfo todoInfo;
  Function removeCallback;

  TestItem(this.todoInfo, this.removeCallback);

  @override
  _TestItemState createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {

  TodoInfo todoInfo;
  Function removeCallback;

  @override
  void initState() {
    super.initState();
    todoInfo = widget.todoInfo;
    removeCallback = widget.removeCallback;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text("id:${todoInfo.id},${todoInfo.title}"),
          ),
        ),
      ),
      /*onTap: (){
        print("eventBus.fire OnTodoDeleteEvent");
        eventBus.fire(OnTodoDeleteEvent(todoInfo));
      },*/
      onTap: (){
        removeCallback(todoInfo.id);
      },
    );
  }
}