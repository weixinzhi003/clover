import 'package:json_annotation/json_annotation.dart';

part 'base_resp.g.dart';

@JsonSerializable()
class BaseResp {

  int errorCode;

  String errorMsg;

  factory BaseResp.fromJson(Map<String, dynamic> json) => _$BaseRespFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRespToJson(this);

  BaseResp(this.errorCode, this.errorMsg);
}