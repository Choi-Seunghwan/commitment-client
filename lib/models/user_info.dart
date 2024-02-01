class UserInfo {
  String? id;
  String? nickname;
  DateTime? createDate;

  UserInfo({required this.nickname, required this.id, required this.createDate});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    createDate = DateTime.parse(json['createDate']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['id'] = id;
    data['createDate'] = createDate?.toIso8601String();

    return data;
  }
}
