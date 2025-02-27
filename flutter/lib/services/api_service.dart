import 'package:components/services/dio_service.dart';
import 'package:dio/dio.dart';

/// This class is explains different API call methods and handle the Errors using Dio package.
/// The Dio package is a powerful HTTP client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout, etc.
/// It is more advanced than the http package.
class ApiService {

  /// Get the Dio instance from DioService
  final Dio _dio = DioService.dio;

  /// Get Call Method
  Future<Response> get(String url) async {
    try {
      final Response response = await _dio.get(url);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Post Call Method
  Future<Response> post(String url, dynamic data) async {
    try {
      final Response response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Put Call Method
  Future<Response> put(String url, dynamic data) async {
    try {
      final Response response = await _dio.put(url, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Delete Call Method
  Future<Response> delete(String url) async {
    try {
      final Response response = await _dio.delete(url);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Patch Call Method
  Future<Response> patch(String url, dynamic data) async {
    try {
      final Response response = await _dio.patch(url, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Multipart Call Method
  Future<Response> multipart(String url, dynamic data) async {
    try {
      final Response response = await _dio.post(url, data: FormData.fromMap(data));
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  /// Handle the error Response codes and return the error message
  _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return 'Request to API server was cancelled';
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout with API server';
      case DioExceptionType.unknown:
        return 'Connection to API server failed due to internet connection';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout in connection with API server';
      case DioExceptionType.badResponse:
        return 'Received invalid status code: ${e.response?.statusCode}';
      case DioExceptionType.sendTimeout:
        return 'Send timeout in connection with API server';
      default:
        return 'Something went wrong';
    }
  }
}