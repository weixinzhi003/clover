import 'package:clover/page/setting/about_us.dart';
import 'package:clover/page/test/communication.dart';
import 'package:clover/page/test/customer_notification.dart';
import 'package:clover/page/test/inherit/parent_box.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
