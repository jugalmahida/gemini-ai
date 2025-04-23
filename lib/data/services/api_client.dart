import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gemini/core/constants/app_constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.baseUrl = AppConstants.apiBaseUrl;
  }

  Future<Response> get(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(endPoint, queryParameters: params);
    } on DioException {
      rethrow;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<Response> post(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.post(endPoint, queryParameters: params);
    } on DioException {
      rethrow;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<Response> put(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.put(endPoint, queryParameters: params);
    } on DioException {
      rethrow;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  Future<Response> delete(String endPoint,
      {Map<String, dynamic>? params}) async {
    try {
      return await _dio.delete(endPoint, queryParameters: params);
    } on DioException {
      rethrow;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }
}
