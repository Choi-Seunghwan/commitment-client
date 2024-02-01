import 'package:commitment_client/models/commitment_activity_info.dart';
import 'package:commitment_client/models/user_info.dart';

class CommitmentInfo {
  String? commitmentId;
  String? title;
  String? description;
  String? createDate;
  int? renewalPeriodDays;
  CommitmentActivityInfo? activity;
  UserInfo? creator;

  CommitmentInfo(
      {required this.commitmentId,
      required this.title,
      required this.description,
      required this.createDate,
      required this.renewalPeriodDays,
      required this.activity,
      required this.creator});

  CommitmentInfo.fromJson(Map<String, dynamic> json) {
    commitmentId = json['commitmentId'];
    title = json['title'];
    description = json['description'];
    createDate = json['createDate'];
    renewalPeriodDays = json['renewalPeriodDays'];
    activity = json['activity'] != null ? CommitmentActivityInfo.fromJson(json['activity']) : null;
    creator = json['creator'] != null ? UserInfo.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commitmentId'] = commitmentId;
    data['title'] = title;
    data['description'] = description;
    data['createDate'] = createDate;
    data['renewalPeriodDays'] = renewalPeriodDays;

    if (activity != null) {
      data['activity'] = activity!.toJson();
    }
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }

    return data;
  }
}
