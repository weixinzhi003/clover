import 'package:clover/entity/news/banner_info.dart';
import 'package:clover/net/api_urls.dart';
import 'package:clover/net/dio_util.dart';
import 'package:clover/page/web/WebView.dart';
import 'package:clover/util/router_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';


class BannerView extends StatefulWidget {
  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {

  List<BannerInfo> bannerList = [];
  SwiperController controller;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio:9/5,
      child: new Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          BannerInfo banner = bannerList[index];
          return Stack(
            children: <Widget>[
              InkWell(
                child: new CachedNetworkImage(
                  imageUrl: banner.imagePath,
                  placeholder: new Center(
                    child: new CircularProgressIndicator(),
                  ),
                  errorWidget: new Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                onTap: (){
                  RouterUtil.openRouter(context, WebView(banner.title, banner.url));
                },
              ),
            ],
          );
        },
        /*pagination: new SwiperPagination(
          margin: EdgeInsets.all(5)
        ),*/
        pagination: new SwiperPagination(
            margin: EdgeInsets.all(5),
            builder:
            new DotSwiperPaginationBuilder(activeColor: Colors.orange)),
        controller: controller,
      ),
    );
  }

  void refresh(){
    bannerList.clear();
    DioUtil.getInstance().getWanAndroid(ApiUrls.BANNERS, (json){
      print(json);
      for (var value in json) {
        bannerList.add(BannerInfo.fromJson(value));
      }
      setState(() {
        controller = new SwiperController();
      });
    });
  }
}
