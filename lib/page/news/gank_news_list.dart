import 'package:clover/entity/news/gank_channel.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/page/news/gank_news_item.dart';
import 'package:flutter/material.dart';
import 'package:clover/entity/news/gank_news.dart';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';

class GankNewsList extends StatefulWidget{

  GankChannel _channel;

  GankNewsList(this._channel);

  @override
  State<StatefulWidget> createState() {
    return new GankNewsState();
  }
}

class GankNewsState extends State<GankNewsList> with AutomaticKeepAliveClientMixin{

  GankChannel _channel;
  var channelParam;
  int curPage = 1;//当前页码，从第一页开始
  int pageSize = 10;//每页显示10条内容

  List<GankNews> newsList = [];

  ScrollController _scrollController = ScrollController();

  bool isLoading = false;//是否正在加载中

  CancelToken cancelToken;

  @override
  void initState() {
    super.initState();
    _channel = this.widget._channel;
    channelParam = _channel.param;
    cancelToken = new CancelToken();
    refresh();
    //给listView添加滑动监听，滑动到底部时加载更多
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    //取消网络请求，否则在请求完成时会报错setState() called after dispose()
    cancelToken.cancel('cancelled');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        child: new ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, i){
            return buildNewsItem(i);
          },
          itemCount: newsList?.length*2,
        ),
        onRefresh: refresh
    );
  }

  void queryData(){
    //如果正在加载中，则退出方法
    if(isLoading){
      return;
    }

    isLoading = true;
    int targetPage = curPage+1;
    var url = 'http://gank.io/api/data/$channelParam/$pageSize/$targetPage';
    DioUtil.getInstance().get(url, (data){
      List<GankNews> respNewsList = [];
      List<dynamic> results = data['results'];
      results.forEach((newsJson){
        GankNews news  = GankNews.fromJson(newsJson);
        respNewsList.add(news);
      });

      curPage = targetPage;
      isLoading = false;

      setState(() {
        if(curPage == 1){
          newsList.clear();
        }
        newsList.addAll(respNewsList);
        print('queryData succed');
      });
    }, cancelToken: cancelToken);
  }

  Future<void> refresh() async{
    curPage = 0;
    queryData();
    setState(() {

    });
  }

  void loadMore(){
    print('loadMore');
    queryData();
  }

  Widget buildNewsItem(int index){
    if(index.isEven){
      return new Divider(height: 0.5, color: Color(0xffd1d1d1));
    }else{
      int newsIndex = index ~/ 2;
      return GankNewsItem(newsList[newsIndex]);
    }
  }

  @override
  bool get wantKeepAlive => true;
}