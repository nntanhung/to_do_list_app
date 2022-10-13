import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';

import 'network.dart';
import '../../app_dependencies.dart';
import '../logger.dart';
import '../mem_cache.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (MemCache.accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${MemCache.accessToken}';
    }
    super.onRequest(options, handler);
  }
}

class TokenInterceptor extends QueuedInterceptor {
  final String _mainInstanceName;

  TokenInterceptor(this._mainInstanceName);

  Future<Map<String, dynamic>?> getToken() async {
    final Map<String, String> params = <String, String>{};
    final tokenDio =
        AppDependencies.injector.get<RestUtils>(instanceName: 'AUTHEN');
    params['refreshToken'] = MemCache.refreshToken;
    params['clientId'] = MemCache.clientId;
    try {
      final Response response =
          await tokenDio.dio.post<dynamic>('/refreshToken', data: params);
      if (response.statusCode == ExceptionHandle.success) {
        return (json.decode(response.data.toString()) as Map<String, dynamic>);
      } else if (response.statusCode == ExceptionHandle.unauthorized) {
        // final AuthGuard authenGuard = AppDependencies.injector.get<AuthGuard>();
        // await authenGuard.clearDataLocal();
        // final AppRouter appRouter = AppDependencies.injector.get<AppRouter>();
        // await appRouter.replaceAll([const LoginRoute()]);
      }
    } catch (e) {
      LoggerUtils.e('Error: ${e.toString()}');
    }
    return null;
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    //401
    if (response.statusCode == ExceptionHandle.unauthorized) {
      LoggerUtils.d('-----------Request Token------------');
      final RestUtils restUtils = AppDependencies.injector
          .get<RestUtils>(instanceName: _mainInstanceName);
      final Map<String, dynamic>? token = await getToken();
      final String? accessToken = token?['access_token'];
      final String? refreshToken = token?['refresh_token'];
      LoggerUtils.d(
          '-----------New AccessToken: $accessToken ------------New RefreshToken: $refreshToken');
      MemCache.accessToken = accessToken ?? '';
      MemCache.refreshToken = refreshToken ?? '';

      if (StringUtils.isNotNullOrEmpty(accessToken)) {
        final Dio dio = Dio();
        dio.options = restUtils.dio.options;
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer $accessToken';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );

        try {
          LoggerUtils.d('----------- Re-Request API ------------');
          final Response response = await dio.request<dynamic>(
            request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioError catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}

class DefaultHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] = 'todo/2022';
    super.onRequest(options, handler);
  }
}

class LoggingInterceptor extends Interceptor {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    LoggerUtils.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LoggerUtils.d('RequestUrl: ${options.baseUrl}${options.path}');
    } else {
      LoggerUtils.d(
          'RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    LoggerUtils.d('RequestMethod: ${options.method}');
    LoggerUtils.d('RequestHeaders:${options.headers}');
    LoggerUtils.d('RequestContentType: ${options.contentType}');
    LoggerUtils.d('RequestData: ${options.data.toString()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      LoggerUtils.d('ResponseCode: ${response.statusCode}');
    } else {
      LoggerUtils.e('ResponseCode: ${response.statusCode}');
    }
    LoggerUtils.d('ResponseData: ${response.data.toString()}');
    LoggerUtils.d('----------End: $duration millisecond----------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LoggerUtils.e('Error: ${err.message}');
    super.onError(err, handler);
  }
}
