import 'dart:convert';

import 'package:clover/entity/user/user.dart';
import 'package:clover/util/sp/sp_util.dart';
import 'package:clover/util/user_util.dart';
import 'package:clover/widget/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:clover/page/setting/about_us.dart';
import 'package:clover/page/test/communication.dart';
import 'package:clover/page/test/customer_notification.dart';
import 'package:clover/page/test/inherit/parent_box.dart';
import 'package:clover/page/test/test_list_view.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/util/sp/sp_keys.dart';


class TestHomePage extends StatefulWidget {

  @override
  TestHomePageState createState() {
    return new TestHomePageState();
  }
}

class TestHomePageState extends State<TestHomePage> {

  String  avatarUrl = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
            ),
            RaisedButton(
              child: Text('获取user'),
              onPressed: (){
//              User user = UserUtil.getLoginUser();
//              Future<User> user = UserUtil.getLoginUserAsync();
//              print(user);
              },
            ),
            RaisedButton(
              child: Text('保存user'),
              onPressed: (){
                String userJson = '{"chapterTops": [],"collectIds": [],"email": "","icon": "","id": 20402,"password": "","token": "","type": 0,"username": "cindy169"}';
                Map<String, dynamic> map = json.decode(userJson);
                User user = User.fromJson(map);
                UserUtil.setLoginUser(user);
              },
            ),
            RaisedButton(
              child: Text('Future'),
              onPressed: testFuture,
            ),
            CustomAvatar(
              avatarUrl
            ),
            RaisedButton(
              child: Text('修改头像1'),
              onPressed: modifyAvatar1,
            ),
            RaisedButton(
              child: Text('修改头像2'),
              onPressed: modifyAvatar2,
            ),
            RaisedButton(
              child: Text('清空头像'),
              onPressed: modifyAvatar3,
            ),
          ],
        ),
      ),
    );
  }

  void testFuture(){
//    String content = getFutureString();
//    print("content:$content");
    UserUtil.getUserFuture().then((user){
      print("testFuture:${user.toString()}");
    });
  }

  String getFutureString(){
    SpUtil.getString(SpKeys.LOGIN_USER).then((value){
      print(value);
      return "first then";
    }).then((value){
      print(value);
      return "second then";
    });
  }

  void modifyAvatar1(){
    setState(() {
      avatarUrl = "https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1698341758,1489378481&fm=173&app=25&f=JPEG?w=218&h=146&s=E0303AD50863A2195B31817703006067";
    });
  }

  void modifyAvatar2(){
    setState(() {
      avatarUrl = "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3857383983,1403277718&fm=173&app=49&f=JPEG?w=218&h=146&s=88326991403104231881F4CB0300E0D2";
    });
  }

  void modifyAvatar3(){
    setState(() {
      avatarUrl = "";
    });
  }
}
