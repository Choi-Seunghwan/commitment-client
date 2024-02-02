class CreateCommitmentReq {
  String title;
  String type;

  CreateCommitmentReq({required this.title, required this.type});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
    };
  }
}
