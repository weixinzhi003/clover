import 'package:clover/entity/todo/todo_info.dart';
import 'package:clover/net/service/todo_service.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/util/text_util.dart';
import 'package:clover/util/toast_util.dart';
import 'package:clover/widget/divider/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

//创建提交todo
class SubmitTodoPage extends StatefulWidget {
  @override
  _SubmitTodoPageState createState() => _SubmitTodoPageState();
}

class _SubmitTodoPageState extends State<SubmitTodoPage> {
  TodoInfo todoInfo;
  TodoType curTodoType;
  List<TodoType> todoTypeList;
  DateTime now = DateTime.now();
  GlobalKey<FormState> formStateKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    todoInfo = new TodoInfo();
    curTodoType = TodoTypes.work;
    todoTypeList = [
      TodoTypes.work,
      TodoTypes.study,
      TodoTypes.life,
      TodoTypes.ent,
    ];
    todoInfo.completeDateStr = "${now.year}-${now.month}-${now.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('创建清单'),
        centerTitle: true,
      ),
      body: Form(
        key: formStateKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              //标题
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: "输入标题",
                  border: InputBorder.none),
              validator: (value) {
                if (TextUtil.isEmpty(value)) {
                  return "标题不能为空";
                }
              },
              onSaved: (value) {
                todoInfo.title = value;
              },
            ),
            TextFormField(
              //内容
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: "输入内容",
                  border: InputBorder.none),
              validator: (value) {
                if (TextUtil.isEmpty(value)) {
                  return "内容不能为空";
                }
              },
              onSaved: (value){
                todoInfo.content = value;
              },
            ),
            //时间
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('完成时间'),
                    Text(todoInfo.completeDateStr)
                  ],
                ),
              ),
              onTap: () {
                showDatePicker(context);
              },
            ),
            InkWell(
              //类型
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('类别'), Text(curTodoType.typeName)],
                ),
              ),
              onTap: () {
                showTypeSheet();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done), onPressed: onSubmitClick),
    );
  }

  //显示日期选择器
  void showDatePicker(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      locale: 'zh',
      minYear: now.year,
      maxYear: now.year + 20,
      cancel: Text('取消'),
      confirm: Text('确定'),
      onChanged: (year, month, date) {},
      onConfirm: (year, month, date) {
        setState(() {
          todoInfo.completeDateStr = "$year-$month-$date";
        });
      },
    );
  }

  //显示类别选择
  void showTypeSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTodoTypeSheetItem(0),
              LineDivider(),
              buildTodoTypeSheetItem(1),
              LineDivider(),
              buildTodoTypeSheetItem(2),
              LineDivider(),
              buildTodoTypeSheetItem(3),
              LineDivider(),
              InkWell(
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('取消'),
                    ],
                  ),
                ),
                onTap: () {
                  RouterUtil.back(context);
                },
              ),
            ],
          );
        });
  }

  Widget buildTodoTypeSheetItem(int index) {
    TodoType type = todoTypeList[index];
    return InkWell(
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(type.typeName),
          ],
        ),
      ),
      onTap: () {
        RouterUtil.back(context);
        setState(() {
          curTodoType = type;
        });
      },
    );
  }

  void onSubmitClick() {
    FormState formState = formStateKey.currentState;
    if (!formState.validate()) {
      return;
    }
    formState.save();
    TodoService.addTodo(todoInfo, curTodoType.type, (json){
//      print(json);
      ToastUtil.show(context, "提交成功", );
      setState(() {
        formState.reset();
      });
    });
  }
}
