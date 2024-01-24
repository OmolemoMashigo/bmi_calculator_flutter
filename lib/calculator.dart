import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double _bmi = 0;

  Calculator({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultBMI() {
    if (_bmi < 18.5) {
      return "Underweight";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "Normal";
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  String bmiInterpretation() {
    if (_bmi < 18.5) {
      return "you have a lower than normal body weight, please east more";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "your body weight is normal, keep it up!";
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      return "you have a higher than normal body weight, please exercise more";
    } else {
      return "your body weight is dangerously high, you are at risk of premature death";
    }
  }
}
