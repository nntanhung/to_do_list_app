import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_auth.g.dart';

@immutable
@JsonSerializable()
class UserAuth {
  final String? accessToken;
  final String? userId;
  final String? refreshToken;

  UserAuth({this.accessToken, this.refreshToken, this.userId});

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthToJson(this);
}