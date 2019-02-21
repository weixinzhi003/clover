import 'package:clover/entity/net/base_resp.dart';
import 'package:json_annotation/json_annotation.dart';

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

  User({this.type, this.id, this.username, this.password, this.icon, this.email,
      this.token, this.chapterTops, this.collectIds});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserResp extends BaseResp{

  User user;

  UserResp(this.user, int errorCode, String errorMsg) : super(errorCode, errorMsg);

  factory UserResp.fromJson(Map<String, dynamic> json) => _$UserRespFromJson(json);

  Map<String, dynamic> toJson() => _$UserRespToJson(this);
}