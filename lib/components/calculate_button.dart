import 'package:flutter/material.dart';
import '../constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({required this.btntext, required this.onTap});

  final String btntext;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          btntext,
          style: kLargeButtonText,
        )),
        color: Color(0xFFEB1455),
        margin: EdgeInsets.only(top: 10),
        height: kBottomContainerHeight,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}
