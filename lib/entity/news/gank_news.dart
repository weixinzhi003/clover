import 'package:json_annotation/json_annotation.dart';

part 'gank_news.g.dart';

@JsonSerializable()
class GankNews{

  @JsonKey(name:'_id')
  String id;
  String createdAt;
  String desc;
  List<String> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  GankNews(
      this.id,
      this.createdAt,
      this.desc,
      this.images,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.used,
      this.who,
      );

  factory GankNews.fromJson(Map<String, dynamic> json) => _$GankNewsFromJson(json);

  Map<String, dynamic> toJson() => _$GankNewsToJson(this);

/*"_id": "5c1372779d21223f5a2baeac",
  "createdAt": "2019-01-03T06:14:37.194Z",
  "desc": "图像风格迁移demo，基于tensorflow lite，功能不太完备，但是基本思路很有趣，用ipc实现tensor模块，一定程度上提高了对内存的容错率，避免OOM。",
  "images": ["https://ww1.sinaimg.cn/large/0073sXn7ly1fyteamvvacj30f00qowqf",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteanw4d6j30f00qotkl",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaon7g6j30f00qo46p",
  "https://ww1.sinaimg.cn/large/0073sXn7ly1fyteaqiqbnj30f00qo7rd"],
  "publishedAt": "2019-01-03T00:00:00.0Z",
  "source": "web",
  "type": "Android",
  "url": "https://github.com/MashirosBaumkuchen/Flora.git",
  "used": true,
  "who": "冬"*/
}