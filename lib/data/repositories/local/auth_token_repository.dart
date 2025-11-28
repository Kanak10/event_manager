import 'package:event_manager/data/provider/local/auth_token_provider.dart';

class AuthTokenRepository {
  Future<AuthTokenProvider> storeFromJson(Map<String, dynamic> headers) async {
    return AuthTokenProvider.storeFromJson(headers);
  }

  bool isUserLoggedIn() {
    return AuthTokenProvider.isUserLoggedIn();
  }

  bool isAgencySetupDone() {
    return AuthTokenProvider.isAgencySetupDone();
  }

  Future<Map<String, String>> retriveTokenFromStore() async {
    return AuthTokenProvider.retrive();
  }

  void logout({bool redirectToStart = false}) async {
  }
}