import 'package:clover/entity/news/gank_news.dart';
import 'package:clover/page/web/WebView.dart';
import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';

class GankNewsItem extends StatelessWidget{

  GankNews news;

  GankNewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    var source = news.source;
    var author = news.who;
    var time = news.publishedAt.substring(0, 10);

    var propertyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12
    );

    return new InkWell(
      child: new Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              news.desc,
              style: TextStyle(
                  color: Color.fromRGBO(44, 44, 44, 1),
                  fontSize: 16
              ),
            ),
            buildImg(),
            new Container(
              margin: EdgeInsets.only(top: 15),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('来源：$source', style: propertyStyle,),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(author, style: propertyStyle,),
                      new Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: new Text(time, style: propertyStyle),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: (){
          RouterUtil.openRouter(context, WebView(news.desc, news.url));
      },
    );
  }

  Widget buildImg(){
    if(news.images == null){
      return new Container();//不能返回null
    }else if(news.images.length == 1 || news.images.length == 2){
//      return Image.network(news.images[0]);
      return new Container(
        margin: EdgeInsets.only(top: 15),
        child: new AspectRatio(
            aspectRatio: 2,
          child: Image.network(news.images[0], fit: BoxFit.cover,),
        ),
      );
    }else{
      return new Padding(
          padding: EdgeInsets.only(top: 15),
        child: new Row(
          children: <Widget>[
            new Expanded(child: Image.network(news.images[0]), flex: 1,),
            new Container(
              width: 10,
            ),
            new Expanded(child: Image.network(news.images[1]), flex: 1,),
            new Container(
              width: 10,
            ),
            new Expanded(child: Image.network(news.images[2]), flex: 1,),
          ],
        )
      );
    }
  }
/*"_id": "5c1372779d21223f5a2baeac",
  "createdAt": "2019-01-03T06:14:37.194Z",
  "desc": "图像风格迁移demo，基于tensorflow lite，功能不太完备，但是基本思路很有趣，用ipc实现tensor模块，一定程度上提高了对内存的容错率，避免OOM。",
  "images": ["https://ww1.sinaimg.cn/large/0073sXn7ly1fyteamvvacj30f00qowqf",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteanw4d6j30f00qotkl",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaon7g6j30f00qo46p",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaqiqbnj30f00qo7rd"],
  "publishedAt": "2019-01-03T00:00:00.0Z",
  "source": "web",
  "type": "Android",
  "url": "https://github.com/MashirosBaumkuchen/Flora.git",
  "used": true,
  "who": "冬"*/
}