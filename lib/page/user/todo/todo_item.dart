import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/service/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:clover/event/customer_event.dart';

class TodoItem extends StatefulWidget {

  TodoInfo todoInfo;

  TodoItem(this.todoInfo);

  @override
  TodoItemState createState() {
    return new TodoItemState();
  }
}

class TodoItemState extends State<TodoItem> {

  TodoInfo todoInfo;

  @override
  void initState() {
    super.initState();
    todoInfo = widget.todoInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Card(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.done), onPressed: doneTodo),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(widget.todoInfo.title),
                    Text(widget.todoInfo.content),
                    Row(
                      children: <Widget>[
                        Text('创建：${widget.todoInfo.date}')
                      ],
                    )
                  ],
                ),
              ),
              IconButton(icon: Icon(Icons.delete), onPressed: doneTodo),
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

  void deleteTodo(int todoId, int status){
//    TodoService.deleteTodo()
  }
}
