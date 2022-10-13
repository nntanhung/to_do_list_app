import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

abstract class BaseRequestModel {
  Map<String, dynamic> toJson();
}

abstract class PagingBaseRequestModel extends BaseRequestModel {
  @JsonKey(includeIfNull: false)
  int? pageSize;
  @JsonKey(includeIfNull: false)
  int? pageIndex;
  @JsonKey(includeIfNull: false)
  String? username;
  @JsonKey(includeIfNull: false)
  String? profileId;
  @JsonKey(includeIfNull: false)
  String? profileType;
  @JsonKey(includeIfNull: false)
  List<String>? roles;
  @JsonKey(includeIfNull: false)
  List<String>? permissions;
  @JsonKey(includeIfNull: false)
  List<OrderBy>? orderBy;
}

class Paging {
  int? pageIndex;
  int? pageSize;

  Paging({
    this.pageIndex,
    this.pageSize,
  });

  factory Paging.fromRawJson(String str) => Paging.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        pageIndex: json['pageIndex'],
        pageSize: json['pageSize'],
      );

  Map<String, dynamic> toJson() => {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      };
}

class Sorting {
  String? propertyName;
  bool? desc;

  Sorting({
    this.propertyName,
    this.desc,
  });

  factory Sorting.fromRawJson(String str) => Sorting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sorting.fromJson(Map<String, dynamic> json) => Sorting(
        propertyName: json['propertyName'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        'propertyName': propertyName,
        'desc': desc,
      };
}

class OrderItem {
  String? propertyName;
  late bool desc;

  OrderItem({this.propertyName, this.desc = true});

  OrderItem.fromJson(Map<String, dynamic> json) {
    propertyName = json['propertyName'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['propertyName'] = propertyName;
    data['desc'] = desc;
    return data;
  }
}

class OrderBy {
  String? propertyName;
  bool? desc;

  OrderBy({this.propertyName, this.desc});

  OrderBy.fromJson(Map<String, dynamic> json) {
    propertyName = json['propertyName'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['propertyName'] = propertyName;
    data['desc'] = desc;
    return data;
  }
}
