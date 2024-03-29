import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/widgets/commitment_list_item.dart';
import 'package:flutter/material.dart';

class CommitmentsList extends StatelessWidget {
  final List<CommitmentInfo> commitments;
  final Function(CommitmentInfo) onRenewBtnPress;

  const CommitmentsList({super.key, required this.commitments, required this.onRenewBtnPress});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commitments.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: CommitmentListItem(
              commitment: commitments[index],
              onPressed: () => onRenewBtnPress(commitments[index]),
            ));
      },
    );
  }
}
