import 'package:exam_demo_unsplash/services/logger_service.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpInterceptor implements InterceptorContract {
  static String API_KEY = "ueLUtaOgF0V8tvSIExWagc5dftKyTIBzi-HMfXaRUcA";

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    try {
      var accessToken = "";
      request.headers.clear();
      request.headers['client_id'] = API_KEY;
      request.headers['Content-type'] = 'application/json';
      LogService.i(request.toString());
    } catch (e) {
      LogService.e(e.toString());
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      LogService.i(response.toString());
    } else {
      LogService.i(response.toString());
    }
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() {

    throw UnimplementedError();
  }

  @override
  Future<bool> shouldInterceptResponse() {

    throw UnimplementedError();
  }
}

class HttpRetryPolicy extends RetryPolicy {
  @override
  int maxRetryAttemps = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    // TODO: implement shouldAttemptRetryOnResponse
    if (response.statusCode == 401) {
      var accessToken = "";
      var refreshToken = "";
      return true;
    }
    return false;
  }
}

class HttpException implements Exception {
  final _message;
  final _prefix;

  HttpException([this._message, this._prefix]);

  @override
  String toString() {

    return "$_prefix$_message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException(String? message)
      : super(message, "Error during connection Unsplash");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request:  Unsplash");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: Unsplash");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: Unsplash");
}
