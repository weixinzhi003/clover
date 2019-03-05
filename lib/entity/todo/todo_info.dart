import 'package:json_annotation/json_annotation.dart';

part 'todo_info.g.dart';

@JsonSerializable()
class TodoInfo extends TodoType {

  static const int STATUS_UNDONE = 0;//未完成
  static const int STATUS_DONE = 1;//已完成

  int userId;
  int id;
  String title;
  String content;
  int date;
  String dateStr;
  int completeDate;
  String completeDateStr;
  int priority; //优先级
  int status;

  TodoInfo({
    this.userId,
    this.id,
    this.title,
    this.content,
    this.date,
    this.dateStr,
    this.completeDate,
    this.completeDateStr,
    this.priority,
    this.status,
    int type,
    String typeIcon,
    String typeName,
  }) : super(type,typeIcon,typeName);

  factory TodoInfo.fromJson(Map<String, dynamic> json) => _$TodoInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoInfoToJson(this);

}

@JsonSerializable()
class TodoType {

  static const int type_work = 1;
  static const int type_study = 2;
  static const int type_life = 3;
  static const int type_ent = 4;

  final int type; //类别 工作1；学习2；生活3； 娱乐4
  final String typeIcon;
  final String typeName;

  const TodoType(this.type, this.typeIcon, this.typeName);

  factory TodoType.fromJson(Map<String, dynamic> json) => _$TodoTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TodoTypeToJson(this);
}

class TodoTypes {
  static const TodoType work = TodoType(
      TodoType.type_work, "images/todo_work.png", "工作");
  static const TodoType study = TodoType(
      TodoType.type_study, "images/todo_study.png", "学习");
  static const TodoType life = TodoType(
      TodoType.type_life, "images/todo_life.png", "生活");
  static const TodoType ent = TodoType(
      TodoType.type_ent, "images/todo_ent.png", "娱乐");
}
