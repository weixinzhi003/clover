import 'package:clover/entity/net/base_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_info.g.dart';

@JsonSerializable()
class BannerInfo{

  int id;
  String title;
  String imagePath;
  String url;

  String desc;
  int isVisible;
  int order;
  int type;

  BannerInfo({this.id, this.title, this.imagePath, this.url, this.desc,
      this.isVisible, this.order, this.type});

  factory BannerInfo.fromJson(Map<String, dynamic> json) => _$BannerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BannerInfoToJson(this);
}

@JsonSerializable()
class BannerInfoResp extends BaseResp{

  BannerInfo bannerInfo;

  BannerInfoResp(this.bannerInfo, int errorCode, String errorMsg) : super(errorCode, errorMsg);

  factory BannerInfoResp.fromJson(Map<String, dynamic> json) => _$BannerInfoRespFromJson(json);

  Map<String, dynamic> toJson() => _$BannerInfoRespToJson(this);
}

