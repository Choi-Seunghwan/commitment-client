import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:flutter/material.dart';

class CommitmentProvider with ChangeNotifier {
  final CommitmentService commitmentService;

  List<CommitmentInfo>? userProgressCommitments;
  List<CommitmentInfo>? userCompletedCommitments;

  CommitmentProvider(this.commitmentService);

  Future<dynamic> getUserCommitments() async {
    final result = await commitmentService.getUserCommitments();

    userProgressCommitments = result['progressCommitments'];
    userCompletedCommitments = result['completedCommitments'];

    notifyListeners();
  }

  Future<dynamic> renewCommitment(String commitmentId) async {
    final result = await commitmentService.renewCommitment(commitmentId);
    CommitmentInfo commitmentInfo = result['commitment'];

    return commitmentInfo;
  }

  Future<dynamic> completeCommitment(String commitmentId) async {
    final result = await commitmentService.completeCommitment(commitmentId);
    CommitmentInfo commitmentInfo = result['commitment'];

    return commitmentInfo;
  }
}
