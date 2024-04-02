import 'package:dio/dio.dart';

class IEXErrorHandler {
  static String from(DioException error) {
    switch (error.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Error to connect with the server, check your connection';
      case DioExceptionType.cancel:
        return 'Request Cancelled';
      default:
        break;
    }
    if (error.response?.statusCode != null) {
      switch (error.response!.statusCode) {
        case 401:
          return 'Unauthorized, please check your credentials';
        case 403:
          return 'Error during your request, please try again';
        case 404:
          return 'Not Found';
        case 500:
          return 'Internal Error';
        case 503:
          return 'The service is unavailable at the moment, please, try again in a few minutes';
      }
    }

    return 'Error to process your request, please, try again';
  }
}
