import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/screens/add_commitment_page.dart';
import 'package:commitment_client/strings/strings.dart';
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

  void onAddBtnHandler() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCommitmentPage()));
  }

  @override
  Widget build(BuildContext context) {
    final commitments = Provider.of<CommitmentProvider>(context).commitments;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            Strings.NAV_MY_COMMITMENTS,
          ),
          backgroundColor: const Color(0xffFFFFFF),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
              color: const Color(0xffEEEEEE),
              height: 2.0,
            ),
          ),
          actions: <Widget>[IconButton(onPressed: () => onAddBtnHandler(), icon: Icon(Icons.add))]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('subTitle'),
            Expanded(child: CommitmentsList(commitments: commitments)),
            const Text('222'),
            Expanded(child: CommitmentsList(commitments: commitments)),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF0F4F7),
    );
  }
}
