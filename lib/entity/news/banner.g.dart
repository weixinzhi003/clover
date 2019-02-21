// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      url: json['url'] as String,
      desc: json['desc'] as String,
      isVisible: json['isVisible'] as int,
      order: json['order'] as int,
      type: json['type'] as int);
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'url': instance.url,
      'desc': instance.desc,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'type': instance.type
    };

BannerResp _$BannerRespFromJson(Map<String, dynamic> json) {
  return BannerResp(
      json['user'] == null
          ? null
          : Banner.fromJson(json['user'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$BannerRespToJson(BannerResp instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'user': instance.user
    };
