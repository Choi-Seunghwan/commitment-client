import 'package:commitment_client/strings/strings.dart';
import 'package:flutter/material.dart';

class AddCommitmentPage extends StatefulWidget {
  const AddCommitmentPage({super.key});

  @override
  AddCommitmentPageState createState() => AddCommitmentPageState();
}

class AddCommitmentPageState extends State<AddCommitmentPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _titleController = TextEditingController();

    void onConfirmBtnHandler() async {
      // await post
      Navigator.of(context).pop();
    }

    @override
    void dispose() {
      _titleController.dispose();
      super.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.PAGE_TITLE_ADD_COMMITMENT),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        labelText: Strings.FORM_TEXT_TITLE, border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: onConfirmBtnHandler,
                    child: Text(Strings.FORM_CONFIRM),
                    style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                  )
                ],
              ),
            )));
  }
}
