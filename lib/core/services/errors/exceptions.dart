import 'package:dio/dio.dart';
import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  String message = "Something went wrong, please try again later.";

  if (e.response != null && e.response?.data != null) {
    try {
      if (e.response!.data is Map<String, dynamic> &&
          e.response!.data.containsKey('message')) {
        message = e.response!.data['message'];
      } else if (e.response!.data is String) {
        message = e.response!.data;
      }
    } catch (_) {
      message = "Unexpected server error.";
    }
  } else {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout. Please check your internet connection.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout. Try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout. Please try again later.";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad certificate from server.";
        break;
      case DioExceptionType.cancel:
        message = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "No internet connection. Please try again.";
        break;
      case DioExceptionType.unknown:
        message = "Unknown error occurred. Please try again.";
        break;
      default:
        message = "Unexpected error. Please try again later.";
    }
  }

  if (e.type == DioExceptionType.badResponse) {
    switch (e.response?.statusCode) {
      case 400:
        message = "Bad request. Please check your data.";
        break;
      case 401:
        message = "Unauthorized. Please log in again.";
        break;
      case 403:
        message = "Access denied.";
        break;
      case 404:
        message = "Resource not found.";
        break;
      case 409:
        message = "Conflict. This data may already exist.";
        break;
      case 422:
        message = "Validation error. Please check your input.";
        break;
      case 500:
        message = "Internal server error. Try again later.";
        break;
      case 504:
        message = "Server timeout. Please try again later.";
        break;
      default:
        message = "Server error: ${e.response?.statusCode ?? 'Unknown'}";
    }
  }

  throw ServerException(errorModel: ErrorModel(message: message));
}
