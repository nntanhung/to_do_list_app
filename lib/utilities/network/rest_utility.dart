import 'dart:async';
import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../logger.dart';
import '../utility.dart';
import 'base_response.dart';
import 'data_result.dart';
import 'error_handler.dart';

int _connectTimeout = 30000;
int _receiveTimeout = 30000;
int _sendTimeout = 10800;

typedef NetSuccessCallback<T> = Function(T data);
typedef NetSuccessListCallback<T> = Function(List<T> data);
typedef NetErrorCallback = Function(int code, String msg);

class RestUtils {
  late Dio dio;

  RestUtils(
    String baseUrl, {
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    List<Interceptor>? interceptors,
  }) {
    final BaseOptions _options = BaseOptions(
      connectTimeout: connectTimeout ?? _connectTimeout,
      receiveTimeout: receiveTimeout ?? _receiveTimeout,
      sendTimeout: sendTimeout ?? _sendTimeout,
      responseType: ResponseType.plain,
      validateStatus: (_) {
        return true;
      },
      baseUrl: baseUrl,
    );
    dio = Dio(_options);

    /// Add default header interceptor
    // dio.interceptors.add(DefaultHeaderInterceptor());

    void addInterceptor(Interceptor interceptor) {
      dio.interceptors.add(interceptor);
    }

    if (interceptors != null && interceptors.isNotEmpty) {
      interceptors.forEach(addInterceptor);
    }
  }

  Future<DataResult<DataResponse<T>>> request<T extends BaseResponseModel>(
    Method method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final Response<String> response = await dio.request<String>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: _checkOptions(method.value, options),
        cancelToken: cancelToken,
      );
      final statusCode = response.statusCode;
      final String dataResponse = response.data!.substring(0,1) == '['
          ? "{\n\"result\":\n${response.data}\n}" : response.data ?? '';
      // final String dataResponse = "{\n\"result\":\n${response.data}\n}";
      // final String dataResponse = response.data ?? '';

      print('--$dataResponse--');
      if (statusCode != null &&
          statusCode >= ExceptionHandle.success &&
          statusCode < ExceptionHandle.multipleChoice) {
        /// Integration test cannot be used isolate https://github.com/flutter/flutter/issues/24703
        /// Use compute conditions: the data response is greater than 10KB (roughly use 10 * 1024) and it is not currently an integration test (it may be adjusted according to the Web environment later)
        /// The main purpose is to reduce unnecessary performance overhead
        final bool isCompute = dataResponse.length > 10 * 1024;
        LoggerUtils.d('isCompute:$isCompute');
        final Map<String, dynamic> _map = isCompute
            ? await compute(_parseData, dataResponse)
            : _parseData(dataResponse);
        var res = DataResponse<T>.fromJson(_map);
        res.statusCode = response.statusCode;
        return DataResult.success(res);
      }
      return DataResult.failure(
          ExceptionHandle.handleError(statusCode, dataResponse));
    } catch (e) {
      LoggerUtils.e(e.toString());
      return DataResult.failure(ExceptionHandle.handleException(e));
    }
  }

  Future<DataResult<String>> download(
    String urlPath,
    String savePath, {
    ProgressCallback? progress,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await dio.download(urlPath, savePath,
          onReceiveProgress: progress,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          data: data,
          options: options);
      final statusCode = response.statusCode;
      if (statusCode != null &&
          statusCode >= ExceptionHandle.success &&
          statusCode < ExceptionHandle.multipleChoice) {
        return DataResult.success(savePath);
      }
      return DataResult.failure(ExceptionHandle.handleError(statusCode, null));
    } catch (e) {
      return DataResult.failure(ExceptionHandle.handleException(e));
    }
  }

  Options _checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}

Map<String, dynamic> _parseData(String data) {
  if (StringUtils.isNullOrEmpty(data)) return <String, dynamic>{};
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, put, patch, delete, head }

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
