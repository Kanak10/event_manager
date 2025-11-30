import 'package:dio/dio.dart';
import 'package:event_manager/utils/constant.dart';
import 'package:flutter/material.dart';

class AuthApi {
  final Dio _dio = Dio();
  
  Future<Response?> signIn(String email, String password) async {
    try {
      final result = await _dio.get("${Constant.REST_BASE_URL}/signin", queryParameters: {
        "email": email,
        "password": password
      });

      debugPrint("result: ${result.statusCode}");
      debugPrint("result: ${result.data}");

      return result;
    } on DioException catch (e) {
      debugPrint("STATUS: ${e.response?.statusCode}");
      debugPrint("DATA: ${e.response?.data}");
      debugPrint("HEADERS: ${e.response?.headers}");
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> googleAuth() async {
    try {
      final result = await _dio.get("${Constant.REST_BASE_URL}/login");

      debugPrint("result: ${result.statusCode}");
      debugPrint("result: ${result.data}");

      return result;
    } on DioException catch (e) {
      debugPrint("STATUS: ${e.response?.statusCode}");
      debugPrint("DATA: ${e.response?.data}");
      debugPrint("HEADERS: ${e.response?.headers}");
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}