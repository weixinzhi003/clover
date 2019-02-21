// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResp _$BaseRespFromJson(Map<String, dynamic> json) {
  return BaseResp(json['errorCode'] as int, json['errorMsg'] as String);
}

Map<String, dynamic> _$BaseRespToJson(BaseResp instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
