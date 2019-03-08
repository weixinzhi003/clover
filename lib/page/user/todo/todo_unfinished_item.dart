import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

//未完成的TodoItem
class TodoUnfinishedItem extends StatefulWidget {

  TodoInfo todoInfo;

  TodoUnfinishedItem(this.todoInfo);

  @override
  TodoUnfinishedItemState createState() {
    return new TodoUnfinishedItemState();
  }
}

class TodoUnfinishedItemState extends State<TodoUnfinishedItem> {

  TodoInfo todoInfo;
  TextStyle titleStyle = TextStyle(
      color: Colors.black87, fontSize: 18
  );
  TextStyle contentStyle = TextStyle(
      color: Colors.grey, fontSize: 14
  );
  TextStyle timeStyle = TextStyle(
      color: Colors.grey, fontSize: 12
  );

  @override
  void initState() {
    super.initState();
    todoInfo = widget.todoInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.done), onPressed: doneTodo),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.todoInfo.title, style: titleStyle,),
                    Text(widget.todoInfo.content, style: contentStyle,),
                    Row(
                      children: <Widget>[
                        Text('创建：${widget.todoInfo.dateStr}', style: timeStyle,),
//                        Text('完成：${widget.todoInfo.completeDateStr}', style: timeStyle,)
                      ],
                    )
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.delete), onPressed: deleteTodo),
            ],
          ),
        ),
      ),
    );
  }

  void doneTodo(){
    TodoService.doneTodo(todoInfo.id, TodoInfo.STATUS_DONE, (json){
      eventBus.fire(OnTodoStatusChangedEvent(todoInfo));
    });
  }

  void deleteTodo(){
    print(todoInfo.toJson());
    TodoService.deleteTodo(todoInfo.id, (json){
      eventBus.fire(OnTodoDeleteEvent(todoInfo));
    });
  }
}
