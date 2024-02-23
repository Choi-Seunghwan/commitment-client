import 'package:flutter/material.dart';

class SquareRadioModel {
  final String value;
  final String label;

  SquareRadioModel({required this.value, required this.label});
}

class SquareRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;
  final String label;

  const SquareRadioButton(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: isSelected
              ? BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        onPressed: () => onChanged(value),
        child: Text(label));
  }
}

class SquareRadioButtonsGroup extends StatefulWidget {
  final List<SquareRadioModel> options; // 옵션 목록
  final String selectedValue; // 현재 선택된 값
  final ValueChanged<String> onValueChanged; // 값이 변경될 때 호출될 콜백 함수

  const SquareRadioButtonsGroup({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onValueChanged,
  });

  @override
  _SquareRadioButtonsGroupState createState() => _SquareRadioButtonsGroupState();
}

class _SquareRadioButtonsGroupState extends State<SquareRadioButtonsGroup> {
  late String _selectedValue = '';

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue; // 위젯의 초기값을 설정합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: widget.options.map((SquareRadioModel option) {
        return SquareRadioButton(
          value: option.value,
          groupValue: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue;
              widget.onValueChanged(newValue);
            });
          },
          label: option.label,
        );
      }).toList(),
    );
  }
}
