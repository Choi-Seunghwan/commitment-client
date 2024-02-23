import 'package:flutter/material.dart';

class TypeSelectionToggleButtons extends StatefulWidget {
  const TypeSelectionToggleButtons({super.key});

  @override
  _TypeSelectionToggleButtonsState createState() => _TypeSelectionToggleButtonsState();
}

class _TypeSelectionToggleButtonsState extends State<TypeSelectionToggleButtons> {
  final List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        // 선택된 인덱스를 제외하고 모든 버튼의 선택 상태를 false로 설정합니다.
        setState(() {
          for (int i = 0; i < _selections.length; i++) {
            _selections[i] = i == index;
          }
        });
      },
      isSelected: _selections,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.call),
        Icon(Icons.cake),
      ],
    );
  }
}
