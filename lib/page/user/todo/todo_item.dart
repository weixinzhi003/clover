import 'package:clover/entity/todo/todo_info.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {

  TodoInfo todoInfo;

  TodoItem(this.todoInfo);

  @override
  TodoItemState createState() {
    return new TodoItemState();
  }
}

class TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }

  void doneTodo(){

  }

  void deleteTodo(){

  }
}
