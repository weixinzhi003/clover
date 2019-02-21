// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      type: json['type'] as int,
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      icon: json['icon'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      chapterTops: json['chapterTops'] as List,
      collectIds: json['collectIds'] as List);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'icon': instance.icon,
      'email': instance.email,
      'token': instance.token,
      'chapterTops': instance.chapterTops,
      'collectIds': instance.collectIds
    };

UserResp _$UserRespFromJson(Map<String, dynamic> json) {
  return UserResp(
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$UserRespToJson(UserResp instance) => <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'user': instance.user
    };
