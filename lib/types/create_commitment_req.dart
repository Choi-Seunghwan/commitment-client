class CreateCommitmentReq {
  String title;
  String type;
  String description;
  int renewalPeriodDays;

  CreateCommitmentReq(
      {required this.title,
      required this.type,
      required this.description,
      required this.renewalPeriodDays});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'renewalPeriodDays': renewalPeriodDays
    };
  }
}
