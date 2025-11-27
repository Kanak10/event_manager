import "package:shared_preferences/shared_preferences.dart";

class AuthTokenProvider {
  String? accessToken;
  String? client;
  String? expiry;
  String? uid;
  String? agencyId;

  // It creates one instance of the class using a private constructor
  static final AuthTokenProvider _singleton = AuthTokenProvider._internal();

  factory AuthTokenProvider() {
    return _singleton;
  }

  AuthTokenProvider._internal();

  static Map<String, String> toJson() {
    return {
      "access-token": _singleton.accessToken ?? "",
      "client": _singleton.client ?? "",
      "expiry": _singleton.expiry ?? "",
      "uid": _singleton.uid ?? "",
      "x-agency-id": _singleton.agencyId ?? "",
    };
  }

  static Future<AuthTokenProvider> storeFromJson(json) async {
    _fromJson(json);
    await _store();
    return _singleton;
  }

  static void clear() async {
    final SharedPreferences prefs = await _prefs();
    prefs.clear();
    _singleton.accessToken = "";
    _singleton.client = "";
    _singleton.expiry = "";
    _singleton.uid = "";
    _singleton.agencyId = "";
  }

  static Future<Map<String, String>> retrive() async {
    final SharedPreferences prefs = await _prefs();
    var token = {
      "access-token": prefs.getString('accessToken') ?? "",
      "client": prefs.getString('client') ?? "",
      "expiry": prefs.getString('expiry') ?? "",
      "uid": prefs.getString('uid') ?? "",
      "x-agency-id": prefs.getString('agencyId') ?? "",
    };

    _fromJson(token);
    return token;
  }

  static Future<SharedPreferences> _prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static _store() async {
    final SharedPreferences prefs = await _prefs();

    prefs.setString("accessToken", _singleton.accessToken ?? "");
    prefs.setString("client", _singleton.client ?? "");
    prefs.setString("expiry", _singleton.expiry ?? "");
    prefs.setString("uid", _singleton.uid ?? "");
    prefs.setString("agencyId", _singleton.agencyId ?? "");
  }

  static void _fromJson(json) {
    _singleton.accessToken = json['access-token'] ?? _singleton.accessToken;
    _singleton.client = json['client'] ?? _singleton.client;
    _singleton.expiry = json['expiry'] ?? _singleton.expiry;
    _singleton.uid = json['uid'] ?? _singleton.uid;
    _singleton.agencyId = json['x-agency-id'] ?? _singleton.agencyId;
  }

  static bool isUserLoggedIn() {
    return isTokenValid(AuthTokenProvider.toJson());
  }

  static bool isAgencySetupDone() {
    return _singleton.agencyId != null && _singleton.agencyId != "";
  }

  static bool isTokenValid(token) {
    return _isTokenPresent(token) && _isTokenNotExpired(token);
  }

  static bool _isTokenNotExpired(token) {
    DateTime now = DateTime.now();
    return !now.isAfter(_expiryDate(token));
  }

  static DateTime _expiryDate(token) {
    if (token['expiry']==null || token['expiry']=="") return DateTime(1970);
    return DateTime(1970).add(Duration(seconds: int.parse(token['expiry'])));
  }

  static bool _isTokenPresent(token) {
    final List<String> tokenKeys = ["access-token", "client", "expiry", "uid"];
    return tokenKeys
        .every((key) => token.containsKey(key) && token[key] != null);
  }

  static int tokenExpireInSeconds() {
    return _expiryDate(toJson()).difference(DateTime.now()).inSeconds;
  }
}
  