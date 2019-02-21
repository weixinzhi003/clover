import 'package:clover/entity/net/base_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner{

  int id;
  String title;
  String imagePath;
  String url;

  String desc;
  int isVisible;
  int order;
  int type;

  Banner({this.id, this.title, this.imagePath, this.url, this.desc,
      this.isVisible, this.order, this.type});

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class BannerResp extends BaseResp{

  Banner user;

  BannerResp(this.user, int errorCode, String errorMsg) : super(errorCode, errorMsg);

  factory BannerResp.fromJson(Map<String, dynamic> json) => _$BannerRespFromJson(json);

  Map<String, dynamic> toJson() => _$BannerRespToJson(this);
}

