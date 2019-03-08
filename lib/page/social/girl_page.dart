import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:clover/entity/user/user.dart';
import 'package:clover/page/social/girl_card.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/net/api_urls.dart';
import 'package:clover/entity/news/gank_news.dart';

class GirlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GirlPageState();
  }
}

class GirlPageState extends State<GirlPage> {

  int curApiPageIndex = 0;//
  List<User> userList = [];

  CancelToken cancelToken;
  bool isLoading;

  Random random = new Random();

  @override
  void initState() {
    super.initState();
    cancelToken = new CancelToken();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
//    initUserList();
    return PageView.builder(
      itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return GirlCard(userList[index]);
        },
      onPageChanged: (index){
          if(index == userList.length-1){
            loadData();
          }
      },
    );
  }

  void loadData(){
    int targetPage = curApiPageIndex+1;
    String url = GankApiUrls.buildChannelNewsListUrl("福利", targetPage);
    DioUtil.getInstance().get(url, (data){
      List<dynamic> results = data['results'];
      results.forEach((newsJson){
        GankNews news  = GankNews.fromJson(newsJson);
        User user = formatNewsToUser(news);
        userList.add(user);
      });

      curApiPageIndex = targetPage;
      isLoading = false;

      setState(() {
//        newsList.addAll(respNewsList);
        print('queryData 福利 succed');
      });
    }, cancelToken: cancelToken);
  }
  
  User formatNewsToUser(GankNews news){

    User user = new User(
      username:news.who,
      avatar:news.url,
      intro:"也许多少年后在某个地方，我将轻声叹息将往事回顾：一片树林里分出两条路——而我选择了人迹更少的一条，从此决定了我一生的道路。",
      fansCount: random.nextInt(5000),
      followCount: random.nextInt(3000)
    );
    return user;
  }
}
