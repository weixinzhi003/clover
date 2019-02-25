// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerInfo _$BannerInfoFromJson(Map<String, dynamic> json) {
  return BannerInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      url: json['url'] as String,
      desc: json['desc'] as String,
      isVisible: json['isVisible'] as int,
      order: json['order'] as int,
      type: json['type'] as int);
}

Map<String, dynamic> _$BannerInfoToJson(BannerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'url': instance.url,
      'desc': instance.desc,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'type': instance.type
    };

BannerInfoResp _$BannerInfoRespFromJson(Map<String, dynamic> json) {
  return BannerInfoResp(
      json['bannerInfo'] == null
          ? null
          : BannerInfo.fromJson(json['bannerInfo'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$BannerInfoRespToJson(BannerInfoResp instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'bannerInfo': instance.bannerInfo
    };
