import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/widgets/commitments_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCommitmentPage extends StatefulWidget {
  const MyCommitmentPage({super.key});

  @override
  _MyCommitmentPageState createState() => _MyCommitmentPageState();
}

class _MyCommitmentPageState extends State<MyCommitmentPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CommitmentProvider>(context, listen: false).fetchCommitments();
  }

  @override
  Widget build(BuildContext context) {
    final commitments = Provider.of<CommitmentProvider>(context).commitments;

    return Scaffold(
      body: CommitmentsList(commitments: commitments),
    );
  }
}
