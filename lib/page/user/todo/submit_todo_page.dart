import 'package:clover/entity/todo/todo_info.dart';
import 'package:flutter/material.dart';

//创建提交todo
class SubmitTodoPage extends StatefulWidget {
  @override
  _SubmitTodoPageState createState() => _SubmitTodoPageState();
}

class _SubmitTodoPageState extends State<SubmitTodoPage> {

  TodoInfo todoInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建清单'),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              //标题
              validator: (value){

              },
            ),
            TextFormField(
              //内容
              validator: (value){

              },
            ),
            //时间
            //类型
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: submit
      ),
    );
  }

  void submit(){

  }
}
