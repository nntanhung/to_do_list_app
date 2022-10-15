// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponse _$AuthenticateResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticateResponse()
      ..accessToken = json['accessToken'] as String?
      ..refreshToken = json['refreshToken'] as String?
      ..errorCode = json['errorCode'] as String?
      ..errorMessage = json['errorMessage'] as String?;

Map<String, dynamic> _$AuthenticateResponseToJson(
        AuthenticateResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
    };

AuthenticateRequest _$AuthenticateRequestFromJson(Map<String, dynamic> json) =>
    AuthenticateRequest()
      ..email = json['email'] as String?
      ..password = json['password'] as String?;

Map<String, dynamic> _$AuthenticateRequestToJson(AuthenticateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  return val;
}
