import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderCardWidget extends StatelessWidget {
  GenderCardWidget({required this.genderIcon, required this.genderString});

  //final because it shouldn't change and must be compiled at runtime
  final IconData genderIcon;
  final String genderString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderString,
          style: kCardTextStyle,
        )
      ],
    );
  }
}
