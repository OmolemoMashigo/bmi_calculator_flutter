import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import '../constants.dart';
import '../components/calculate_button.dart';
import '../components/round_icon_button.dart';

enum GenderType {
  male,
  female,
}

// const bottomContainerHeight = 80.0;
// const activeCardColor = Color(0xFF1D1E33);
// const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 10;

  void updateGenderCardColour(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColor == kInactiveCardColor) {
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kInactiveCardColor;
      }
    } else {
      if (femaleCardColor == kInactiveCardColor) {
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kInactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardWidget(
                    onPress: () {
                      setState(() {
                        updateGenderCardColour(GenderType.male);
                      });
                    },
                    cardChild: GenderCardWidget(
                      genderIcon: FontAwesomeIcons.mars,
                      genderString: "MALE",
                    ),
                    colour: maleCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCardWidget(
                    onPress: () {
                      setState(() {
                        updateGenderCardColour(GenderType.female);
                      });
                    },
                    cardChild: GenderCardWidget(
                        genderIcon: FontAwesomeIcons.venus,
                        genderString: "FEMALE"),
                    colour: femaleCardColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardWidget(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //along the length of the row, so horizontally
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline
                              .alphabetic, //along the width of the row, so vertically
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberFontStyle,
                            ),
                            Text(
                              "cm",
                              style: kCardTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 24),
                              thumbColor: Color(0xFFEB1455),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x1fEB1455)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            //activeColor: Color(0xFFEB1455),
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCardWidget(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberFontStyle,
                            ),
                            Text(
                              "kgs",
                              style: kCardTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCardWidget(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberFontStyle,
                            ),
                            Text(
                              "yrs",
                              style: kCardTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            btntext: "CALCULATE YOUR BMI",
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              // Navigator.pushNamed(
              //   context,
              //   '/results',
              // );
              // MaterialPageRoute(
              //   builder: (context) => ResultsPage(
              //     bmiResult: calc.resultBMI(),
              //     bmiNumber: calc.calculateBMI(),
              //     bmiInterpretation: calc.bmiInterpretation(),
              //   ),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.resultBMI(),
                      bmiNumber: calc.calculateBMI(),
                      bmiInterpretation: calc.bmiInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
