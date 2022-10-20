// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketResponse _$CreateTicketResponseFromJson(
        Map<String, dynamic> json) =>
    CreateTicketResponse()
      ..id = json['id'] as String?
      ..projectId = json['project_id'] as String?
      ..content = json['content'] as String?
      ..description = json['description'] as String?
      ..isCompleted = json['is_completed'] as bool?
      ..labels =
          (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..priority = json['priority'] as int?
      ..creatorId = json['creator_id'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..due = json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>)
      ..url = json['url'] as String?;

Map<String, dynamic> _$CreateTicketResponseToJson(
        CreateTicketResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'content': instance.content,
      'description': instance.description,
      'is_completed': instance.isCompleted,
      'labels': instance.labels,
      'priority': instance.priority,
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt?.toIso8601String(),
      'due': instance.due,
      'url': instance.url,
    };

CreateTicketRequest _$CreateTicketRequestFromJson(Map<String, dynamic> json) =>
    CreateTicketRequest()
      ..content = json['content'] as String?
      ..description = json['description'] as String?
      ..due = json['due'] == null
          ? null
          : Due.fromJson(json['due'] as Map<String, dynamic>)
      ..projectId = json['project_id'] as String?
      ..id = json['id'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..creatorId = json['creator_id'] as String?;

Map<String, dynamic> _$CreateTicketRequestToJson(CreateTicketRequest instance) {
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
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('creator_id', instance.creatorId);
  return val;
}
