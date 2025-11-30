import 'package:event_manager/data/provider/remote/auth_api.dart';
import 'package:flutter/widgets.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<dynamic> signIn(String email, String password) async {
    final response = await authApi.signIn(email, password);

    debugPrint("response: ${response?.data}");
    debugPrint("response: ${response?.statusCode}");

    return response;
  }

  Future<dynamic> googleAuth() async {
    final response = await authApi.googleAuth();

    debugPrint("response: ${response?.data}");
    debugPrint("response: ${response?.statusCode}");

    return response;
  }
}