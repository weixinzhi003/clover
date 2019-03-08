import 'package:clover/entity/user/user.dart';
import 'package:clover/page/setting/about_us.dart';
import 'package:clover/page/test/communication.dart';
import 'package:clover/page/test/customer_notification.dart';
import 'package:clover/page/test/inherit/parent_box.dart';
import 'package:clover/page/test/test_list_view.dart';
import 'package:clover/page/user/todo/todo_home.dart';
import 'package:clover/util/router_util.dart';
import 'package:clover/util/user_util.dart';
import 'package:clover/widget/custom_avatar.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {

  User user;
  List<OptionItem> optionItems;

  @override
  void initState() {
    super.initState();
    user = UserUtil.getLoginUser();
  }

  void initOptionItems(BuildContext context){
    optionItems = [
      OptionItem("待办清单", 'images/user_fragment_my_assessment.png', (){
        RouterUtil.openRouter(context, TodoHome());
      }),
      OptionItem("我的观点", 'images/user_fragment_opinion.png', (){
//        RouterUtil.openRouter(context, EndlessListPage());
      }),
      OptionItem("我的回答", 'images/user_fragment_post.png', (){
//        RouterUtil.openRouter(context, Login());
      }),
      OptionItem("礼券", 'images/user_fragment_prize.png', (){
//        RouterUtil.openRouter(context, Login());
      }),
      OptionItem("背包", 'images/user_fragment_store.png', (){
//        RouterUtil.openRouter(context, CarouselSlidePage());
      }),
      OptionItem("设置", 'images/user_fragment_setting.png', (){
//        RouterUtil.openRouter(context, MyInfo());
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initOptionItems(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.only(top: 60, bottom: 30),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: CustomAvatar(
                      user.avatar,
                      width: 80,
                    ),
                    onTap: (){
//                      RouterUtil.openRouter(context, UserDetail());
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 25),
                    child: Text(user.username, style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RelationItem("粉丝", user.fansCount),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                        child: RelationItem("关注", user.followCount),),
                      RelationItem("收藏", user.favoriteCount),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: optionItems,
            )
          ],
        ),
      ),
    );
  }
}

class RelationItem extends StatelessWidget {

  String title;
  int count;

  RelationItem(this.title, this.count);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(count.toString(), style: TextStyle(color: Colors.white, fontSize: 20),),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 11),),
      ],
    );
  }
}

class OptionItem extends StatelessWidget {

  String title;
  String iconPath;
  GestureTapCallback onTap;

  OptionItem(this.title, this.iconPath, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 45,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(iconPath, width: 18,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Text(title),
              ),
            ),
            Image.asset('images/next_gray.png', width: 7.5)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
