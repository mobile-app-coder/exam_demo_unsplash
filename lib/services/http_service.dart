import 'package:http/http.dart';

class Network {
  static const String BASE = "api.unsplash.com";

  static String key = "ueLUtaOgF0V8tvSIExWagc5dftKyTIBzi-HMfXaRUcA";

  static Map<String, String> headers = {};

  static Future<String?> GET(String api, Map<String, dynamic> parameter) async {
    var uri = Uri.http(BASE, api, parameter);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Map<String, String> paramsSearch(String search_string) {
    Map<String, String> params = {};
    params.addAll({
      'per_page': '30',
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

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    params.addAll({
      'per_page': '30',
      'client_id': key,
    });
    return params;
  }

  static const String PHOTOS_API = "/photos";
  static const String COLLECTIONS_API = "/collections";
  static const String SEARCH_API = "/search/photos";
}