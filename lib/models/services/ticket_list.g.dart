// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketListResponse _$TicketListResponseFromJson(Map<String, dynamic> json) =>
    TicketListResponse(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => TicketResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketListResponseToJson(TicketListResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

TicketResultResponse _$TicketResultResponseFromJson(
        Map<String, dynamic> json) =>
    TicketResultResponse(
      creatorId: json['creator_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isCompleted: json['is_completed'] as bool?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      due: json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>),
      id: json['id'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projectId: json['project_id'] as String?,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$TicketResultResponseToJson(
        TicketResultResponse instance) =>
    <String, dynamic>{
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_completed': instance.isCompleted,
      'content': instance.content,
      'description': instance.description,
      'due': instance.due,
      'id': instance.id,
      'labels': instance.labels,
      'project_id': instance.projectId,
      'parent_id': instance.parentId,
    };

TicketListRequest _$TicketListRequestFromJson(Map<String, dynamic> json) =>
    TicketListRequest()
      ..content = json['content'] as String?
      ..description = json['description'] as String?
      ..due = json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>)
      ..projectId = json['project_id'] as String?
      ..id = json['id'] as String?
      ..createdAt = json['created_at'] as String?
      ..creatorId = json['creator_id'] as String?;

Map<String, dynamic> _$TicketListRequestToJson(TicketListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('description', instance.description);
  writeNotNull('due', instance.due);
  writeNotNull('project_id', instance.projectId);
  writeNotNull('id', instance.id);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('creator_id', instance.creatorId);
  return val;
}

Due _$DueFromJson(Map<String, dynamic> json) => Due(
      json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      date: json['date'] as String?,
      lang: json['lang'] as String?,
      string: json['string'] as String?,
      isRecurring: json['is_recurring'] as bool?,
    );

Map<String, dynamic> _$DueToJson(Due instance) => <String, dynamic>{
      'date': instance.date,
      'datetime': instance.datetime?.toIso8601String(),
      'lang': instance.lang,
      'string': instance.string,
      'is_recurring': instance.isRecurring,
    };
