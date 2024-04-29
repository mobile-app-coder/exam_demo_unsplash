import 'dart:io';

import 'package:exam_demo_unsplash/services/htt_helper_srevice.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class Network {
  static const String BASE = "api.unsplash.com";

  static String key = "ueLUtaOgF0V8tvSIExWagc5dftKyTIBzi-HMfXaRUcA";

  static Map<String, String> headers = {};

  static final client = InterceptedClient.build(
      interceptors: [HttpInterceptor()], retryPolicy: HttpRetryPolicy());

  static Future<String?> GET(String api, Map<String, dynamic> parameter) async {
    try {
      var uri = Uri.http(BASE, api, parameter);
      var response = await get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }

  static Map<String, String> paramsSearch(String search_string,int pageNumber) {
    Map<String, String> params = {};
    params.addAll({
      'per_page': '30',
      'page': pageNumber.toString(),
      'client_id': key,
      'query': search_string,
    });
    return params;
  }

  static Map<String, String> paramsGetCollection() {
    Map<String, String> params = {};
    params.addAll({
      'client_id': key,
    });
    return params;
  }

  static Map<String, String> paramsEmpty(int pageNumber) {
    Map<String, String> params = {};
    params.addAll({
      'per_page': '30',
      'page': pageNumber.toString(),
      'client_id': key,
    });
    return params;
  }

  static const String PHOTOS_API = "/photos";
  static const String COLLECTIONS_API = "/collections";
  static const String SEARCH_API = "/search/photos";

  static _throwException(Response response) {
    String reason = response.reasonPhrase!;
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(reason);
      case 401:
        throw InvalidInputException(reason);
      case 403:
        UnauthorisedException(reason);
      case 404:
        throw FetchDataException(reason);
      default:
        throw FetchDataException(reason);
    }
  }
}
