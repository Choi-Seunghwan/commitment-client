import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:flutter/material.dart';

class CommitmentProvider with ChangeNotifier {
  final CommitmentService commitmentService;

  List<CommitmentInfo>? userProgressCommitments;

  CommitmentProvider(this.commitmentService);

  Future<dynamic> getUserCommitments(String type, String status) async {
    final result = await commitmentService.getUserCommitments(type, status);

    userProgressCommitments = result['commitments'];

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
