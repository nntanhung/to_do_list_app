// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketResponse _$CreateTicketResponseFromJson(
        Map<String, dynamic> json) =>
    CreateTicketResponse()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..commentCount = json['commentCount'] as int?
      ..color = json['color'] as String?
      ..isShared = json['isShared'] as bool?
      ..order = json['order'] as int?
      ..isFavorite = json['isFavorite'] as bool?
      ..isInboxProject = json['isInboxProject'] as bool?
      ..isTeamInbox = json['isTeamInbox'] as bool?
      ..viewStyle = json['viewStyle'] as String?
      ..url = json['url'] as String?
      ..parentId = json['parentId'] as String?;

Map<String, dynamic> _$CreateTicketResponseToJson(
        CreateTicketResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'commentCount': instance.commentCount,
      'color': instance.color,
      'isShared': instance.isShared,
      'order': instance.order,
      'isFavorite': instance.isFavorite,
      'isInboxProject': instance.isInboxProject,
      'isTeamInbox': instance.isTeamInbox,
      'viewStyle': instance.viewStyle,
      'url': instance.url,
      'parentId': instance.parentId,
    };

CreateTicketRequest _$CreateTicketRequestFromJson(Map<String, dynamic> json) =>
    CreateTicketRequest()
      ..content = json['content'] as String?
      ..description = json['description'] as String?
      ..due = json['due'] as String?
      ..id = json['id'] as String?;

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
  writeNotNull('id', instance.id);
  return val;
}
