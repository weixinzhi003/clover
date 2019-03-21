// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoInfo _$TodoInfoFromJson(Map<String, dynamic> json) {
  return TodoInfo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      date: json['date'] as int,
      dateStr: json['dateStr'] as String,
      completeDate: json['completeDate'] as int,
      completeDateStr: json['completeDateStr'] as String,
      priority: json['priority'] as int,
      status: json['status'] as int,
      type: json['type'] as int,
      typeIcon: json['typeIcon'] as String,
      typeName: json['typeName'] as String);
}

Map<String, dynamic> _$TodoInfoToJson(TodoInfo instance) => <String, dynamic>{
      'type': instance.type,
      'typeIcon': instance.typeIcon,
      'typeName': instance.typeName,
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date,
      'dateStr': instance.dateStr,
      'completeDate': instance.completeDate,
      'completeDateStr': instance.completeDateStr,
      'priority': instance.priority,
      'status': instance.status
    };

TodoType _$TodoTypeFromJson(Map<String, dynamic> json) {
  return TodoType(json['type'] as int, json['typeIcon'] as String,
      json['typeName'] as String);
}

Map<String, dynamic> _$TodoTypeToJson(TodoType instance) => <String, dynamic>{
      'type': instance.type,
      'typeIcon': instance.typeIcon,
      'typeName': instance.typeName
    };
