import 'package:commitment_client/service/commitment_service.dart';
import 'package:flutter/material.dart';

class CommitmentProvider with ChangeNotifier {
  final CommitmentService commitmentService;

  CommitmentProvider(this.commitmentService);
}
