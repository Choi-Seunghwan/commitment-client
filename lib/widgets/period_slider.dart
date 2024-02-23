import 'package:flutter/material.dart';

class PeriodSlider extends StatefulWidget {
  const PeriodSlider({super.key, required this.onValueChange});

  final ValueChanged<double> onValueChange;

  @override
  PeriodSliderState createState() => PeriodSliderState();
}

class PeriodSliderState extends State<PeriodSlider> {
  double _currentSliderValue = 3;

  String calcDate(double days) {
    final currentDate = DateTime.now();
    final futureDate = currentDate.add(Duration(days: days.toInt()));
    return '${futureDate.year}년 ${futureDate.month}월 ${futureDate.day}일';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: _currentSliderValue,
          min: 1,
          max: 7,
          divisions: 6,
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
        Text(
          '${calcDate(_currentSliderValue)}까지 다시 다짐 가능',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
