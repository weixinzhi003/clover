import 'package:clover/entity/todo/todo_info.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {

  TodoInfo todoInfo;

  TodoItem(this.todoInfo);

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
                  Text(todoInfo.title),
                  Text(todoInfo.content),
                  Row(
                    children: <Widget>[
                      Text('创建：${todoInfo.date}')
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

  //修改状态为已完成
  void doneTodo(){

  }

  //删除todo
  void deleteTodo(){

  }
}
