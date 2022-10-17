import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utilities/network/network.dart';

part 'ticket_list.g.dart';

@JsonSerializable()
class TicketListResponse extends BaseResponseModel {
  TicketListResponse({this.result});
  List<TicketResultResponse>? result;

  @override
  TicketListResponse fromJson(Map<String, dynamic> json) =>
      _$TicketListResponseFromJson(json);
}

@JsonSerializable()
class TicketResultResponse{
  String? creatorId;
  DateTime? createdAt;
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

  TicketResultResponse fromJson(Map<String, dynamic> json) =>
      _$TicketResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResultResponseToJson(this);
}

@JsonSerializable()
class TicketListRequest extends BaseRequestModel {
  @JsonKey(includeIfNull: false)
  String? id;

  TicketListRequest();
  @override
  Map<String, dynamic> toJson() => _$TicketListRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Due {
  String? date;
  DateTime? datetime;
  String? lang;
  String? string;
  bool? isRecurring;
  

  Due(this.datetime, {this.date, this.lang, this.string, this.isRecurring});

  @override
  factory Due.fromJson(Map<String, dynamic> json) => _$DueFromJson(json);

  Map<String, dynamic> toJson() => _$DueToJson(this);
}