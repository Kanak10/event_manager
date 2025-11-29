import 'package:event_manager/data/provider/remote/user_api.dart';

class UserRepository {
  final UserAPI userAPI;

  UserRepository(this.userAPI);

  Future<dynamic> fetchUser() async {
    final response = await userAPI.getUser();
    return response;
  }
}
