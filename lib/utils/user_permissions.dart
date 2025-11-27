import '../data/models/user_model.dart';

class UserPermissionsSingleton {
  UserPermissionsSingleton._internal();

  static final UserPermissionsSingleton _instance =
      UserPermissionsSingleton._internal();

  static UserPermissionsSingleton get instance => _instance;

  final Map<String, dynamic> permissions = {};

  bool hasAccessAll = false;
  bool hasInitialLoad = false;

  void initialize(
    Map<String, dynamic>? permission,
    bool accessAll, {
    bool enableCamelCase = false,
    required User user,
  }) async {
  }

  bool isUserHasPermission(String key) {
    return permissions[key] ?? false;
  }

  bool checkPermission(String key) {
    var value = isUserHasPermission(key);
    if (!value) showError();
    return value;
  }

  void showError() {}
}
