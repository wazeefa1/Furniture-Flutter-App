import 'package:amazcart/config/config.dart';
import 'package:amazcart/network/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: URLs.API_URL,
      connectTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
      receiveTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
      sendTimeout: Duration(milliseconds: AppLimit.REQUEST_TIME_OUT),
    );

    var dio = Dio(options);

    dio.interceptors.add(LoggingInterceptor());

    return dio;
  }

  @override
  void dependencies() {
    Get.lazyPut(
      _dio,
    );
  }
}
