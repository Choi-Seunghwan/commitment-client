import 'package:commitment_client/models/user_info.dart';

class CommitmentInfo {
  String? id;
  String? title;
  UserInfo? creator;
  String? createDate;
  int? days;
  String? status;

  CommitmentInfo({this.id, this.title, this.creator, this.createDate, this.days, this.status});

  CommitmentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creator = json['creator'] != null ? UserInfo.fromJson(json['creator']) : null;
    createDate = json['createDate'];
    days = json['days'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    data['createDate'] = createDate;
    data['days'] = days;
    data['status'] = status;
    return data;
  }
}
