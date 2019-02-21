import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget{

  String title;
  String url;

  WebView(this.title, this.url);

  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }
}

class WebViewState extends State<WebView>{

  String title;
  String url;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    url = widget.url;
    print("url:"+url);
    print("title:"+title);
  }

  @override
  Widget build(BuildContext context) {

    return new WebviewScaffold(
        url: url,
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            tooltip: 'Navigation menu',
            onPressed: (){
              RouterUtil.back(context);
            }),
        iconTheme: new IconThemeData(color: Colors.white),
        title: new Text(title),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'search',
              onPressed: (){})
        ],
      ),
      withZoom: true,//允许网页缩放
      withLocalStorage: true, // 允许LocalStorage
      withJavascript: true,
    );
  }
}