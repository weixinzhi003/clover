import 'package:clover/entity/net/base_resp.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'user.g.dart';

@JsonSerializable()
class User{

  int type;
  int id;
  String username;
  String password;
  String icon;
  String email;
  String token;

  List chapterTops;
  List collectIds;

  //额外的，假的
  String avatar = "https://upload-images.jianshu.io/upload_images/15781245-4219a73993bb7a7d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/500/format/webp";
  String intro;//简介
  int fansCount;//粉丝数量
  int followCount;//关注数量
  int postCount;//帖子数量
  int favoriteCount;

  User({this.type, this.id, this.username, this.password, this.icon, this.email,
      this.token, this.chapterTops, this.collectIds, this.avatar, this.intro,
      this.fansCount, this.followCount, this.postCount,
      this.favoriteCount}); //收藏数量

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return json.encode(this);
//    return '{type: $type, id: $id, username: $username, password: $password, icon: $icon, email: $email, token: $token, chapterTops: $chapterTops, collectIds: $collectIds, avatar: $avatar, intro: $intro, fansCount: $fansCount, followCount: $followCount, postCount: $postCount, favoriteCount: $favoriteCount}';
  }


}

@JsonSerializable()
class UserResp extends BaseResp{

  User user;

  UserResp(this.user, int errorCode, String errorMsg) : super(errorCode, errorMsg);

  factory UserResp.fromJson(Map<String, dynamic> json) => _$UserRespFromJson(json);

  Map<String, dynamic> toJson() => _$UserRespToJson(this);
}