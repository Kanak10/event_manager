import 'package:event_manager/data/provider/remote/user_api.dart';

class UserRepository {
  final UserAPI apiService;

  UserRepository(this.apiService);

  Future<dynamic> fetchUser() async {
    final response = await apiService.getUser();
    return response;
  }
}
