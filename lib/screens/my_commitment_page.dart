import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/widgets/add_commitment_modal_bottom_sheet.dart';
import 'package:commitment_client/widgets/commitments_list.dart';
import 'package:commitment_client/widgets/float_add_button.dart';
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
  }

  Future<void> initProgressCommitmets() async {
    Provider.of<CommitmentProvider>(context, listen: false)
        .getUserCommitments(CommitmentStatus.progress, CommitmentType.personal);
  }

  void onAddBtnHandler(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const AddCommitmentBottomSheetWidget();
        },
        isScrollControlled: true);
  }

  @override
  Widget build(BuildContext context) {
    final userProgressCommitments =
        Provider.of<CommitmentProvider>(context).userProgressCommitments ?? [];

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
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('안녕하세요~'),
            Expanded(child: CommitmentsList(commitments: userProgressCommitments)),
          ],
        ),
      ),
      backgroundColor: const Color(0xffF0F4F7),
      floatingActionButton: FloatAddButton(
        onPressed: () => onAddBtnHandler(context),
      ),
    );
  }
}
