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
      isCompleted: json['isCompleted'] as bool?,
      content: json['content'] as String?,
      description: json['description'] as String?,
      due: json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>),
      id: json['id'] as String?,
      labels:
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      projectId: json['project_id'] as String?,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$TicketResultResponseToJson(
        TicketResultResponse instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'content': instance.content,
      'description': instance.description,
      'due': instance.due,
      'id': instance.id,
      'labels': instance.labels,
      'projectId': instance.projectId,
      'parentId': instance.parentId,
    };

TicketListRequest _$TicketListRequestFromJson(Map<String, dynamic> json) =>
    TicketListRequest()..id = json['id'] as String?;

Map<String, dynamic> _$TicketListRequestToJson(TicketListRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

Due _$DueFromJson(Map<String, dynamic> json) => Due(
      json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      date: json['date'] as String?,
      lang: json['lang'] as String?,
      string: json['string'] as String?,
      isRecurring: json['isRecurring'] as bool?,
    );

Map<String, dynamic> _$DueToJson(Due instance) => <String, dynamic>{
      'date': instance.date,
      'datetime': instance.datetime?.toIso8601String(),
      'lang': instance.lang,
      'string': instance.string,
      'isRecurring': instance.isRecurring,
    };
