import 'package:clover/page/main/discovery.dart';
import 'package:clover/page/main/me.dart';
import 'package:clover/page/main/news_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  theme: new ThemeData(
    buttonColor: Colors.blue,
  ),
  home: new MyApp(),
));

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IndexedStack(
        index: _tabIndex,
        children: <Widget>[
          new NewsHome(),
          new Discovery(),
          new Me()
        ],
      ),
//      drawer: new MainDrawer(),
      bottomNavigationBar: new CupertinoTabBar(
        currentIndex: _tabIndex,
        items: getBottomNavItems(),
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavItems(){
    List<BottomNavigationBarItem> itemList = new List();
    for(int i=0; i<tabImages.length; i++){
      itemList.add(new BottomNavigationBarItem(
          icon: tabImages[i][0],
          title: getTabTitle(i),
          activeIcon: tabImages[i][1],
          backgroundColor:tabBgColors[i]
      )
      );
    }
    return itemList;
  }

  // 根据索引值确定Tab是选中状态的样式还是非选中状态的样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new TextStyle(
          color: Colors.orange,
          fontSize: 12
      );
    }
    return new TextStyle(
        color: Colors.grey,
        fontSize: 12
    );
  }

// 根据索引值确定TabItem的icon是选中还是非选中
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

// 根据索引值返回页面顶部标题
  Text getTabTitle(int curIndex) {
    return new Text(
        appBarTitles[curIndex],
        style: getTabTextStyle(curIndex)
    );
  }

  // 页面底部TabItem上的图标数组
  List<dynamic> tabImages;

// 页面顶部的大标题（也是TabItem上的文本）
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];
  var tabBgColors = [Colors.red, Colors.green, Colors.deepPurpleAccent, Colors.grey];

// 数据初始化，包括TabIcon数据和页面内容数据
  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/tab_home_n.png'),
          getTabImage('images/tab_home_s.png')
        ],
        [
          getTabImage('images/tab_class_n.png'),
          getTabImage('images/tab_class_s.png')
        ],
        /*[
          getTabImage('images/tab_work_n.png'),
          getTabImage('images/tab_work_s.png')
        ],*/
        [
          getTabImage('images/tab_user_n.png'),
          getTabImage('images/tab_user_s.png')
        ]
      ];
    }
  }

// 传入图片路径，返回一个Image组件
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }
}

