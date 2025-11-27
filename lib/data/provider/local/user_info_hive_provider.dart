import 'dart:convert';

import 'package:hive/hive.dart';

class UserInfoHiveProvider {
  static Future<Box> _box() async {
    Box box = await Hive.openBox('userInfo');
    return box;
  }

  static void storeBannerInfoInHive(Map<String, dynamic> result) async {
    final Box box = await _box();
    await box.put('bannerInfo', jsonEncode(result));
  }
}