import 'dart:io'; //引入dart的基本库io提供对I/O的支持
import 'package:dio/dio.dart'; //引入dio.dart
import 'Config.dart'; //引入dio.dart

// ignore: camel_case_types
class DioHelper {
  static DioHelper instance;

  static String token;

  static Config _config = new Config();

  static Dio _dio;

  BaseOptions _options;

  static DioHelper getInstance() {
    print("getInstance");

    if (instance == null) {
      instance = new DioHelper();
    }
  }

  DioHelper() {
    // 初始化 Options
    _options = new BaseOptions(
        baseUrl: _config.base_url,
        connectTimeout: _config.connectTimeout,
        receiveTimeout: _config.receiveTimeout,
        responseType: _config.responseType,
        headers: _config.headers);

    _dio = new Dio(_options);

    //这里是请求拦截(暂时不做任何处理)
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print(options.contentType);
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
      //请求成功拦截
      print(response.statusCode);
      return response; // continue
    }, onError: (DioError e) {
      //请求失败拦截
      print(e);
      return e; //continue
    }));
  }

  // get 请求封装
  // ignore: avoid_init_to_null
  Future<Response> get(url, {options, cancelToken, data = null}) async {
    print('get:::url：$url ,body: $data');
    Response response;
    try {
      response =
          await _dio.get(url, queryParameters: data, cancelToken: cancelToken);
//      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response;
  }

  // post请求封装
  // ignore: avoid_init_to_null
  Future<Response> post(url, {options, cancelToken, data = null}) async {
    print('post请求::: url：$url ,body: $data');
    Response response;
    try {
      response = await _dio.post(url,
          data: data != null ? data : {}, cancelToken: cancelToken);
//      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response;
  }
}
