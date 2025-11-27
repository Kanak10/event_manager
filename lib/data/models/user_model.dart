class User {
  String id;
  String name;
  String mobileNo;
  String role;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        mobileNo = json['mobileNo'] ?? json['mobile_no'] ?? "",
        role = json['role'] ?? "";

  static List<User> listFromJson(Map<String, dynamic> json) =>
      json['nodes'].map<User>((json) => User.fromJson(json)).toList();

  bool get isOrganiser => role == "organizer";

  bool get isAttainee => role == "attainee";
}
