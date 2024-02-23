import 'package:flutter/material.dart';

class PeriodSlider extends StatefulWidget {
  const PeriodSlider({super.key, required this.onValueChange});

  final ValueChanged<double> onValueChange;

  @override
  PeriodSliderState createState() => PeriodSliderState();
}

class PeriodSliderState extends State<PeriodSlider> {
  double _currentSliderValue = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: _currentSliderValue,
          min: 1,
          max: 7,
          divisions: 7,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value; // 슬라이더의 값을 업데이트
            });
            widget.onValueChange(value);
          },
        ),
        Text(
          '${_currentSliderValue.toStringAsFixed(0)}일',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text('x월 x일에까지 다시 다짐 가능'),
      ],
    );
  }
}
