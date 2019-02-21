import 'package:clover/entity/news/gank_channel.dart';
import 'package:clover/page/news/gank_news_list.dart';
import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';

class NewsHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsHomeState();
  }
}

class NewsHomeState extends State<NewsHome>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [];
  List<Widget> tabViews = [];
  TabController _controller;

  List<GankChannel> channels = [];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        length: GankChannel.channelTitles.length, vsync: this);
    _controller.addListener(() {
      /*int index = _controller.index;
      if(_controller.indexIsChanging){
        print("indexIsChanging true $index");
      }else{
        print("indexIsChanging false $index");
      }*/
    });
    buildTabs();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange,
          title: new Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white),
                child: new InkWell(
                  child: new Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: new Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text(
                              '比特币价格|越狱第五季|金毛',
                              style: TextStyle(color: Colors.grey, fontSize: 15),
                            )
                        )
                      ],
                    ),
                  ),
                  onTap: () {
//                    RouterUtil.openRouter(context, SearchPage());
                  },
                )),
          ),
          bottom: new TabBar(
            tabs: tabs,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            labelStyle: new TextStyle(fontSize: 14),
            unselectedLabelColor: Colors.black87,
            unselectedLabelStyle: new TextStyle(fontSize: 14),
            isScrollable: true,
            controller: _controller,
          ),
        ),
        body: new TabBarView(controller: _controller, children: tabViews));
  }

  void buildTabs() {
    setState(() {
      channels.clear();
      for (int i = 0; i < GankChannel.channelTitles.length; i++) {
        GankChannel channel = GankChannel.build(
            GankChannel.channelTitles[i], GankChannel.channelParams[i]);
        channels.add(channel);
      }

      channels.forEach((channel) {
        Tab tab = new Tab(text: channel.title);
        tabs.add(tab);
        GankNewsList newsList = new GankNewsList(channel);
        tabViews.add(newsList);
      });
    });
  }
}
