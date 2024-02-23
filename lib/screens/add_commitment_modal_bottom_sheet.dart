import 'package:commitment_client/provider/commitment_provider.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/widgets/period_slider.dart';
import 'package:commitment_client/widgets/square_radio_button.dart';
import 'package:commitment_client/widgets/sub_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          Strings.UI_ADD_COMMITMENT_TITLE,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                      height: 40,
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SubTitle(title: '다짐 유형'),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SquareRadioButtonsGroup(options: [
                          SquareRadioModel(
                              value: CommitmentType.personal, label: Strings.FORM_TYPE_PERSONAL),
                          SquareRadioModel(
                              value: CommitmentType.public, label: Strings.FORM_TYPE_PUBLIC),
                        ], selectedValue: _type, onValueChanged: typeChangeHandler),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '나만의 다짐',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '으로 나의 목표를 이뤄보아요'),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '모두의 다짐',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: '으로 다함께 목표를 이뤄보아요'),
                          ],
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 40,
                    ),
                    const SubTitle(title: '다시 다짐하기 기간'),
                    const SizedBox(
                      height: 15,
                    ),
                    PeriodSlider(onValueChange: periodSliderChangeHandler),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("기간 내에 다시 다짐하기 버튼을 눌러 목표를 이어갈 수 있어요")
                  ],
                )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: confirmBtnHandler,
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text(Strings.FORM_CREATE),
              ),
            )),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
