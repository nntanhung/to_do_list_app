import 'dart:convert';
import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorCode;
  final String message;

  const Failure(this.errorCode, this.message);

  @override
  List<Object> get props => [errorCode, message];
}

// General failures
class GenericFailure extends Failure {
  const GenericFailure(String errorCode, String message)
      : super(errorCode, message);
}

class ApiFailure extends Failure {
  final int statusCode;
  const ApiFailure(this.statusCode, String errorCode, String message)
      : super(errorCode, message);

  factory ApiFailure.fromJson(Map<String, dynamic> json, int statusCode) {
    return ApiFailure(statusCode, json['ErrorCode'] as String? ?? '',
        json['ErrorMessage'] as String? ?? '');
  }

  factory ApiFailure.fromJsonSSO(Map<String, dynamic> json, int statusCode) {
    return ApiFailure(statusCode, json['errorCode'] as String? ?? '', '');
  }
}

class ExceptionHandle {
  static const int success = 200;
  static const int successNotContent = 204;
  static const int multipleChoice = 300;
  static const int notModified = 304;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int badRequest = 400;
  static const int internalServerError = 500;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;

  static const int netError = 1000;
  static const int parseError = 1001;
  static const int socketError = 1002;
  static const int httpError = 1003;
  static const int connectTimeoutError = 1004;
  static const int sendTimeoutError = 1005;
  static const int receiveTimeoutError = 1006;
  static const int cancelError = 1007;
  static const int unknownError = 9999;

  static final Map<int, ApiFailure> _errorMap = <int, ApiFailure>{
    netError: const ApiFailure(netError, 'network_error', 'Network Error'),
    parseError: const ApiFailure(parseError, 'parse_error', 'Parse Error'),
    socketError: const ApiFailure(socketError, 'socket_error',
        'Bạn đang mất kết nối mạng. Vui lòng kiểm tra lại đường truyền.'),
    httpError: const ApiFailure(httpError, 'http_error', 'Http Error'),
    connectTimeoutError: const ApiFailure(
        connectTimeoutError,
        'connect_timeout',
        'Vui lòng liên hệ với trung tâm hỗ trợ kỹ thuật để được hỗ trợ.'),
    sendTimeoutError: const ApiFailure(
        sendTimeoutError, 'sent_timeout', 'Send Timeout Error'),
    receiveTimeoutError: const ApiFailure(
        receiveTimeoutError, 'receive_timeout', 'Không nhận được phản hồi từ máy chủ.'),
    cancelError: const ApiFailure(cancelError, 'cancel_error', 'Cancel Error'),
    internalServerError: const ApiFailure(
        internalServerError, 'internal_server_error', 'Đã có lỗi xảy ra.'),
    forbidden: const ApiFailure(
        forbidden, 'forbidden', 'Bạn không có quyền xem nội dung này.'),
    notFound:
        const ApiFailure(notFound, 'not_found', 'Không tìm thấy nội dung.'),
    badGateway: const ApiFailure(
        badGateway, 'bad_gateway', 'Không kết nối được với máy chủ.'),
    serviceUnavailable: const ApiFailure(
        serviceUnavailable, 'service_unavailable', 'Dịch vụ không khả dụng.'),
    gatewayTimeout: const ApiFailure(gatewayTimeout, 'gateway_timeout',
        'Không nhận được phản hồi từ máy chủ.')
  };

  static ApiFailure handleError(int? statusCode, String? data) {
    if (statusCode == badRequest && StringUtils.isNotNullOrEmpty(data)) {
      final List<dynamic>? errors = jsonDecode(data!);
      final List<ApiFailure>? apiFailure = errors
          ?.map((e) => ApiFailure.fromJson(
              e as Map<String, dynamic>, statusCode ?? unknownError))
          .toList();
      if (apiFailure != null && apiFailure.isNotEmpty) {
        return apiFailure.first;
      }
    }

    /// Login error case
    if (statusCode == unauthorized && StringUtils.isNotNullOrEmpty(data)) {
      final error = jsonDecode(data!);
      return ApiFailure.fromJsonSSO(error, statusCode ?? unknownError);
    }
    return _errorMap[statusCode] ??
        ApiFailure(
            statusCode ?? unknownError, 'unknown_error', 'Unknown Error');
  }

  static ApiFailure handleException(dynamic error) {
    if (error is DioError) {
      if (error.type.errorCode == 0) {
        return _handleException(error.error);
      } else {
        return _errorMap[error.type.errorCode]!;
      }
    } else {
      return _handleException(error);
    }
  }

  static ApiFailure _handleException(dynamic error) {
    int errorCode = unknownError;
    if (error is SocketException) {
      errorCode = socketError;
    }
    if (error is HttpException) {
      errorCode = httpError;
    }
    if (error is FormatException) {
      errorCode = parseError;
    }
    return _errorMap[errorCode] ??
        ApiFailure(errorCode, 'unknown_error', 'Unknown Error');
  }
}

extension DioErrorTypeExtension on DioErrorType {
  int get errorCode => [
        ExceptionHandle.connectTimeoutError,
        ExceptionHandle.sendTimeoutError,
        ExceptionHandle.receiveTimeoutError,
        0,
        ExceptionHandle.cancelError,
        0,
      ][index];
}
