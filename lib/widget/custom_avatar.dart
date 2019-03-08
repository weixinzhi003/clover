import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomAvatar extends StatelessWidget {
  String imgUrl;
  double width = 30;
  double height = 30;
  double borderWidth = 1;
  Color borderColor = Colors.white;
  Widget errorWidget = Icon(Icons.account_circle);


  CustomAvatar(this.imgUrl, {
    this.width = 45,
    this.borderWidth = 1,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: width,
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width/2)),
          border: new Border.all(color: borderColor, width: borderWidth)),
      child: new ClipOval(
        child: new CachedNetworkImage(
          imageUrl: imgUrl,
          errorWidget: errorWidget,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
