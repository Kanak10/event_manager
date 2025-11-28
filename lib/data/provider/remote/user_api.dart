import 'package:dio/dio.dart';

class UserAPI {
  final Dio _dio = Dio();

  Future<Response> getUser() async {
    return await _dio.get("https://api.myapp.com/user/profile");
  }
}
