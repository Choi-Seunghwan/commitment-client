import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:flutter/material.dart';

class CommitmentListItem extends StatelessWidget {
  final CommitmentInfo commitment;

  CommitmentListItem({required this.commitment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.abc),
      title: Text(commitment.title ?? 'null'),
      trailing: ElevatedButton(
        child: Text(Strings.commitmentUpdateBtn),
        onPressed: () {},
      ),
    );
  }
}
