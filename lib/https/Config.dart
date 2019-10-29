import 'package:dio/dio.dart'; //引入dio.dart
import 'dart:io'; //引入dart的基本库io提供对I/O的支持

class Config {
  String base_url = 'https://apps.swufe-online.com/';
  int connectTimeout = 5000; //链接超时，单位毫秒
  int receiveTimeout = 3000; //接收超时，单位毫秒
  var responseType = ResponseType.json; //定制接收的数据类型
  var headers = {
    HttpHeaders.userAgentHeader: "dio",
//    "Authorization": '_token',
  };
}
