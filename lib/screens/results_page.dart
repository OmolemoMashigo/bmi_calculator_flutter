import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/calculate_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.bmiNumber,
      required this.bmiInterpretation});

  final String bmiResult;
  final String bmiNumber;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment:
                  Alignment.bottomLeft, //so it goes down to the bottom left
              child: Text(
                "YOUR RESULT:",
                style: kResultTitleText,
              ),
            ),
          ),
          Expanded(
            child: ReusableCardWidget(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiNumber,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiInterpretation,
                    style: kInterpretationText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: CalculateButton(
              btntext: "RE-CALCULATE",
              onTap: () {
                //Navigator.pushNamed(context, '/');
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
