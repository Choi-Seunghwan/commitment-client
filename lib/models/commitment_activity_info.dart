class CommitmentActivityInfo {
  String? commitmentActivityId;
  bool? isActive;
  DateTime renewalDate;
  DateTime? expirationDate;
  DateTime? completeDate;
  int? processDays;
  String? status;

  CommitmentActivityInfo(
      {this.commitmentActivityId,
      required this.isActive,
      required this.renewalDate,
      required this.expirationDate,
      required this.completeDate,
      required this.processDays,
      required this.status});

  CommitmentActivityInfo.fromJson(Map<String, dynamic> json)
      : commitmentActivityId = json['commitmentActivityId'],
        isActive = json['isActive'],
        renewalDate = DateTime.parse(json['renewalDate']),
        expirationDate = DateTime.parse(json['expirationDate']),
        completeDate = json['completeDate'] != null ? DateTime.parse(json['completeDate']) : null,
        processDays = json['processDays'],
        status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commitmentActivityId'] = commitmentActivityId;
    data['isActive'] = isActive;
    data['renewalDate'] = renewalDate?.toIso8601String();
    data['expirationDate'] = expirationDate?.toIso8601String();

    if (data['completeDate'] != null) {
      data['completeDate'] = completeDate?.toIso8601String();
    }
    data['processDays'] = processDays;
    data['status'] = status;

    return data;
  }
}
