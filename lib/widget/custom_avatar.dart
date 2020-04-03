import 'package:clover/util/text_util.dart';
import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class CustomAvatar extends StatelessWidget {
  String imgUrl;
  double width = 30;
  double height = 30;
  double borderWidth = 1;
  Color borderColor = Colors.white;
  Widget errorWidget = Icon(Icons.account_circle);
  String defaultImgAssestName;

  CustomAvatar(this.imgUrl, {
    this.width = 45,
    this.borderWidth = 1,
    this.borderColor = Colors.white,
    this.defaultImgAssestName = 'images/default_avatar.png'
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: width,
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width/2)),
          border: new Border.all(color: borderColor, width: borderWidth)),
      /*child: new ClipOval(
        child: new CachedNetworkImage(
          imageUrl: imgUrl,
          errorWidget: Image.asset('images/default_avatar.png'),
          fit: BoxFit.cover,
        ),
      ),*/
      child: new ClipOval(
        child: buildImg(),
      ),
    );
  }

  Widget buildImg(){
    //CachedNetworkImage一走到errorWidget后，再怎么修改imageUrl都没办法正常显示了，所以在imgUrl为空时，先显示普通的Image
    if(TextUtil.isEmpty(imgUrl)){
      return Image.asset(defaultImgAssestName, fit: BoxFit.cover);
    }else{
      /*return new CachedNetworkImage(
        imageUrl: imgUrl,
        errorWidget: Image.asset(defaultImgAssestName),
        fit: BoxFit.cover,
      );*/
      return Image.asset(defaultImgAssestName, fit: BoxFit.cover);
    }
  }
}
