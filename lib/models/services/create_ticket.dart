import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utilities/network/network.dart';

part 'create_ticket.g.dart';

@JsonSerializable()
class CreateTicketResponse extends BaseResponseModel {
  String? id;
  String? name;
  int? commentCount;
  String? color;
  bool? isShared;
  int? order;
  bool? isFavorite;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? viewStyle;
  String? url;
  String? parentId;

  
  @override
  CreateTicketResponse fromJson(Map<String, dynamic> json) =>
      _$CreateTicketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketResponseToJson(this);
}


@JsonSerializable()
class CreateTicketRequest extends BaseRequestModel {
  @JsonKey(includeIfNull: false)
  String? content;
  @JsonKey(includeIfNull: false)
  String? description;
  @JsonKey(includeIfNull: false)
  String? due;
  @JsonKey(includeIfNull: false)
  String? id;

  CreateTicketRequest();
  @override
  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}