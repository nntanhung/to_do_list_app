import 'package:get_it/get_it.dart';

class DataResponse<T extends BaseResponseModel> {
  int? statusCode;
  String? message;
  String? errorCode;
  late T dataResponse;

  DataResponse(this.statusCode, this.message, this.dataResponse);

  DataResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'] as String?;
    message = json['ErrorMessage'] as String?;
    final response = GetIt.I.get<T>();
    dataResponse = response.fromJson(json);
  }
}

abstract class BaseResponseModel<T> {
  T fromJson(Map<String, dynamic> json);
}