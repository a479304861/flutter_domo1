import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_domo1/doubanDemo/http/http_config.dart';

class Api {
  static Dio _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: TIME_OUT,
  ));

  static getHello() async {
    Response response;
    try {
      response = await _dio.get(BASE_URL + "/hello");
    } catch (e) {
      print(e);
    }
    return response;
  }

  static Future  get(String url, {Map<String, dynamic> params}) async {
    try {
     Response response = await _dio.get(url,queryParameters: params);
      return response;
    } catch (e) {

    }
  }

  static getCookie() async {
    {
      var dio = Dio();
      var cookieJar = CookieJar();
      dio.interceptors.add(CookieManager(cookieJar));
      // Print cookies
      print(cookieJar.loadForRequest(Uri.parse("http://localhost/")));
      // second request with the cookie
      await dio.get("http://10.170.85.188:8080/checkUser/");
    }
  }
}
