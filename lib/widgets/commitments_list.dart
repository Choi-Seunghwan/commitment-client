import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/widgets/commitment_list_item.dart';
import 'package:flutter/material.dart';

class CommitmentsList extends StatelessWidget {
  final List<CommitmentInfo> commitments;

  const CommitmentsList({super.key, required this.commitments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commitments.length,
      itemBuilder: (context, index) {
        return CommitmentListItem(commitment: commitments[index]);
      },
    );
  }
}
