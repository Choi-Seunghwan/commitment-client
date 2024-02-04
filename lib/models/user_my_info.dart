class UserMyInfo {
  String? id;
  String? email;
  String? nickname;
  bool? isGuest;
  DateTime? createDate;

  UserMyInfo(
      {required this.id,
      required this.email,
      required this.nickname,
      required this.isGuest,
      required this.createDate});

  UserMyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nickname = json['nickname'];
    isGuest = json['isGuest'];
    createDate = DateTime.parse(json['createDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['nickname'] = nickname;
    data['isGuest'] = isGuest;
    data['createDate'] = createDate?.toIso8601String();

    return data;
  }
}
