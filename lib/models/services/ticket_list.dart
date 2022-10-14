import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utilities/network/network.dart';

part 'ticket_list.g.dart';

@JsonSerializable()
class TicketListResponse extends BaseResponseModel {
  TicketListResponse();
  TicketResult? result;

  @override
  TicketListResponse fromJson(Map<String, dynamic> json) =>
      _$TicketListResponseFromJson(json);
}

@JsonSerializable()
class TicketResult {
  TicketResult();
  List<TicketResultResponse>? listItem;
  factory TicketResult.fromJson(Map<String, dynamic> json) =>
      _$TicketResultFromJson(json);
}

@JsonSerializable()
class TicketResultResponse {
  String? creatorId;
  String? createdAt;
  bool? isCompleted;
  String? content;
  String? description;
  Due? due;
  String? id;
  List<String>? labels;
  String? projectId;
  String? parentId;
  TicketResultResponse({
    this.creatorId,
    this.createdAt,
    this.isCompleted,
    this.content,
    this.description,
    this.due,
    this.id,
    this.labels,
    this.projectId,
    this.parentId,
  });
  factory TicketResultResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResultResponseFromJson(json);

  // @override
  // TicketResultResponse fromJson(Map<String, dynamic> json) =>
  //     _$TicketResultResponseFromJson(json);

  // Map<String, dynamic> toJson() => _$TicketResultResponseToJson(this);
}

@JsonSerializable()
class TicketListRequest extends BaseRequestModel {
  @JsonKey(includeIfNull: false)
  String? id;

  TicketListRequest();
  @override
  Map<String, dynamic> toJson() => _$TicketListRequestToJson(this);
}

@JsonSerializable()
class Due {
  DateTime? date;
  DateTime? datetime;

  Due(this.date, this.datetime);

  @override
  factory Due.fromJson(Map<String, dynamic> json) =>
      _$DueFromJson(json);

  Map<String, dynamic> toJson() => _$DueToJson(this);
}
