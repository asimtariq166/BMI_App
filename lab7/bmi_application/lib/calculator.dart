import 'dart:math';

class Calculator {
  int height = 0;
  int weight = 0;
  double bmi = 0;

  Calculator(int h, int w) {
    height = h;
    weight = w;
  }

  String calcBmi() {
    bmi = this.weight /
        pow(this.height * 0.01, 2); //height in cm, hence converted to meters
    return bmi.toStringAsFixed(1);
  }

  String outMsg() {
    if (bmi < 18.5) {
      return "You have a less than normal body weight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "You have a normal body weight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "You have a higher than normal body weight";
    } else {
      return "You have a higher than high body weight";
    }
  }
}
