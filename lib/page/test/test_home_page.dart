import 'package:flutter/material.dart';
import 'package:clover/page/setting/about_us.dart';
import 'package:clover/page/test/communication.dart';
import 'package:clover/page/test/customer_notification.dart';
import 'package:clover/page/test/inherit/parent_box.dart';
import 'package:clover/page/test/test_list_view.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/util/router_util.dart';

class TestHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
          InkWell(
            child: Text('todo'),
            onTap: (){
              RouterUtil.openRouter(context, TodoHome());
            },
          ),
          InkWell(
            child: Text('About Us'),
            onTap: (){
              RouterUtil.openRouter(context, AboutUs());
            },
          ),
          InkWell(
            child: Text('customer notification'),
            onTap: (){
              RouterUtil.openRouter(context, NotifyTestWidget());
            },
          ),
          RaisedButton(
            child: Text('customer notification'),
            onPressed: (){
              RouterUtil.openRouter(context, ParentWidget());
            },
          ),
          RaisedButton(
            child: Text('test Inherit Widget'),
            onPressed: (){
              RouterUtil.openRouter(context, TestInheritPage());
            },
          ),
          RaisedButton(
            child: Text('test listview update'),
            onPressed: (){
              RouterUtil.openRouter(context, TestListView());
            },
          )
        ],
      ),
    );
  }
}
