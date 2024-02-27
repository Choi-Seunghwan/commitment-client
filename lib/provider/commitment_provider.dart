import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/service/commitment_service.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/types/create_commitment_req.dart';
import 'package:flutter/material.dart';

class CommitmentProvider with ChangeNotifier {
  final CommitmentService commitmentService;

  List<CommitmentInfo>? userPersonalCommitments;
  List<CommitmentInfo>? userPublicCommitments;

  CommitmentProvider(this.commitmentService);

  void _updateCommitmentInList(CommitmentInfo updatedCommitment) {
    int index = userPersonalCommitments?.indexWhere(
            (commitment) => commitment.commitmentId == updatedCommitment.commitmentId) ??
        -1;
    if (index != -1) {
      userPersonalCommitments![index] = updatedCommitment;
      notifyListeners();
    }
  }

  Future<List<CommitmentInfo>> getUserCommitments(
      {required String type, required String status}) async {
    final userCommitments = await commitmentService.getUserCommitments(type, status);

    if (type == CommitmentType.personal) {
      userPersonalCommitments = userCommitments;
    } else if (type == CommitmentType.public) {
      userPublicCommitments = userCommitments;
    }

    notifyListeners();

    return userCommitments ?? [];
  }

  Future<CommitmentInfo> createCommitment(
      String title, String type, String description, int renewalPeriodDays) async {
    final req = CreateCommitmentReq(
        title: title, type: type, description: description, renewalPeriodDays: renewalPeriodDays);
    final commitmentInfo = await commitmentService.createCommitment(req);

    // _updateCommitmentInList(commitmentInfo);

    return commitmentInfo;
  }

  Future<CommitmentInfo?> renewCommitment(String commitmentId) async {
    CommitmentInfo? commitmentInfo = await commitmentService.renewCommitment(commitmentId);

    if (commitmentInfo == null) {
      return null;
    }

    _updateCommitmentInList(commitmentInfo);
    notifyListeners();

    return commitmentInfo;
  }

  Future<CommitmentInfo> completeCommitment(String commitmentId) async {
    final result = await commitmentService.completeCommitment(commitmentId);
    CommitmentInfo commitmentInfo = result['commitment'];

    return commitmentInfo;
  }
}
