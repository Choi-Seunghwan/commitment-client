import 'package:commitment_client/models/user_info.dart';

class CommitmentInfo {
  String? id;
  String? title;
  UserInfo? creator;
  String? createDate;
  int? days;
  String? status;

  CommitmentInfo(
      {this.id,
      this.title,
      this.creator,
      this.createDate,
      this.days,
      this.status});

  CommitmentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    creator =
        json['creator'] != null ? new UserInfo.fromJson(json['creator']) : null;
    createDate = json['createDate'];
    days = json['days'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['createDate'] = this.createDate;
    data['days'] = this.days;
    data['status'] = this.status;
    return data;
  }
}
