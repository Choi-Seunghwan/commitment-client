import 'package:flutter/material.dart';

class AddCommitmentBottomSheetWidget extends StatelessWidget {
  const AddCommitmentBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.close),
            heightFactor: 3,
          ),
          Center(
            child: Text(
              '다짐 만들기',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
