import 'package:json_annotation/json_annotation.dart';
part 'page.g.dart';

@JsonSerializable()
class Page{
  int curPage;
  List<dynamic> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  Page({this.curPage, this.datas, this.offset, this.over, this.pageCount,
      this.size, this.total});

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}