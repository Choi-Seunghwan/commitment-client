import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/screens/add_commitment_modal_bottom_sheet.dart';
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
  List<CommitmentInfo> _userProgressCommitments = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initProgressCommitmets();
    });
  }

  Future<void> initProgressCommitmets() async {
    List<CommitmentInfo> userProgressCommitments =
        await Provider.of<CommitmentProvider>(context, listen: false)
            .getUserCommitments(type: CommitmentType.personal, status: CommitmentStatus.progress);

    setState(() {
      _userProgressCommitments = userProgressCommitments;
    });
  }

  void onAddBtnHandler(BuildContext context) {
    /*
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const AddCommitmentBottomSheet();
        },
        isScrollControlled: true);
    */

    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddCommitmentBottomSheet(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ));
  }

  Future<void> onRenewBtnHandler(CommitmentInfo cm) async {
    await Provider.of<CommitmentProvider>(context, listen: false).renewCommitment(cm.commitmentId);
  }

  @override
  Widget build(BuildContext context) {
    final userProgressCommitments =
        Provider.of<CommitmentProvider>(context).userProgressCommitments ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.NAV_MY_COMMITMENTS,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: CommitmentsList(
              commitments: _userProgressCommitments,
              onRenewBtnPress: onRenewBtnHandler,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatAddButton(
        onPressed: () => onAddBtnHandler(context),
      ),
    );
  }
}
