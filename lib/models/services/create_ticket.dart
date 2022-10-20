import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utilities/network/network.dart';
import 'ticket_list.dart';

part 'create_ticket.g.dart';

@JsonSerializable()
class CreateTicketResponse extends BaseResponseModel {
  String? id;
  String? projectId;
  String? content;
  String? description;
  bool? isCompleted;
  List<String>? labels;
  int? priority;
  String? creatorId;
  DateTime? createdAt;
  Due? due;
  String? url;

  
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
  Due? due;
  @JsonKey(includeIfNull: false)
  String? projectId;
  @JsonKey(includeIfNull: false)
  String? id;
  @JsonKey(includeIfNull: false)
  DateTime? createdAt;
  @JsonKey(includeIfNull: false)
  String? creatorId;
  @JsonKey(includeIfNull: false)
  String? dueDatetime;

  CreateTicketRequest();
  @override
  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}