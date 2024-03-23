import 'package:logger/logger.dart';

class LogService {
  static final Logger _logger =
  Logger(filter: DevelopmentFilter(), printer: PrettyPrinter());

  static d(String message) {
    _logger.d(message);
  }

  static i(String message) {
    _logger.i(message);
  }

  static e(String message) {
    _logger.e(message);
  }

  static w(String message) {
    _logger.w(message);
  }
}