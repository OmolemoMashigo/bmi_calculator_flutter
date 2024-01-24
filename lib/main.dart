import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/results': (context) => ResultsPage(),
      // },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF090D21),
        ),
        scaffoldBackgroundColor: Color(0xFF090D21),
      ),
      //home: InputPage(),
    );
  }
}
