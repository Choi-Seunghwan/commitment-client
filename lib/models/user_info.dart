class UserInfo {
  String? nickname;
  String? id;

  UserInfo({this.nickname, this.id});

  UserInfo.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['id'] = this.id;
    return data;
  }
}
