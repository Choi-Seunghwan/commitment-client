import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/widgets/period_slider.dart';
import 'package:commitment_client/widgets/square_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCommitmentBottomSheet extends StatefulWidget {
  const AddCommitmentBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  AddCommitmentBottomSheetState createState() => AddCommitmentBottomSheetState();
}

class AddCommitmentBottomSheetState extends State<AddCommitmentBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _period = 3;
  String _type = CommitmentType.personal;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void periodSliderChangeHandler(double newValue) {
    setState(() {
      _period = newValue;
    });
  }

  void typeChangeHandler(String newValue) {
    setState(() {
      _type = newValue;
    });
  }

  void confirmBtnHandler() async {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      String type = _type;
      int renewalPeriodDays = _period.toInt();
      await Provider.of<CommitmentProvider>(context, listen: false)
          .createCommitment(title, type, description, renewalPeriodDays);

      await Provider.of<CommitmentProvider>(context, listen: false)
          .getUserCommitments(type: type, status: CommitmentStatus.progress);

      Navigator.of(context).pop();
    } else {
      // @todo : show Toast
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Align(
            alignment: Alignment.topRight,
            heightFactor: 3,
            child: Icon(Icons.close),
          ),
          Center(
              child: SquareRadioButtonsGroup(
                  options: const [CommitmentType.public, CommitmentType.personal],
                  selectedValue: _type,
                  onValueChanged: typeChangeHandler)),
          const Center(
            child: Text(
              Strings.UI_ADD_COMMITMENT_TITLE,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text('Title'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        labelText: Strings.FORM_TEXT_TITLE, border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        labelText: Strings.FORM_TEXT_DESCRIPTION, border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PeriodSlider(onValueChange: periodSliderChangeHandler),
                  ElevatedButton(
                    onPressed: confirmBtnHandler,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    child: const Text(Strings.FORM_CONFIRM),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
