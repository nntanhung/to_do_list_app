import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utilities/network/network.dart';
part 'authenticate.g.dart';


@JsonSerializable()
class AuthenticateResponse extends BaseResponseModel {
  String? accessToken;
  String? refreshToken;
  String? errorCode;
  String? errorMessage;

  AuthenticateResponse();

  @override
  AuthenticateResponse fromJson(Map<String, dynamic> json) =>
      _$AuthenticateResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthenticateResponseToJson(this);
}

@JsonSerializable()
class AuthenticateRequest extends BaseRequestModel {
  @JsonKey(includeIfNull: false)
  String? email;
  @JsonKey(includeIfNull: false)
  String? password;

  AuthenticateRequest();
  @override
  Map<String, dynamic> toJson() => _$AuthenticateRequestToJson(this);
}