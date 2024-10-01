import 'dart:math';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-type'] = 'application/json';
    //TODO read token from storage

    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: "POST"))
        .then((value) {
      print(value.headers.toString());
      print(value.data.toString());
      print(value.statusCode.toString());

      return value;
    });
  }
}
