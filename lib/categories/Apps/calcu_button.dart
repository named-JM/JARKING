// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CalculatorButtons extends StatelessWidget {
  final onTap;
  final String buttonText;
  bool isCalcuButtonPressed;

  //create constructor for thi s one
  CalculatorButtons(
      {required this.buttonText,
      this.onTap,
      required this.isCalcuButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), //<--- to make it smoother
        height: 70,
        width: 70,
        child: Center(
          child: Text(
            buttonText, // Use the provided buttonText parameter
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isCalcuButtonPressed ? Colors.grey[600] : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: isCalcuButtonPressed ? Colors.red[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
            boxShadow: isCalcuButtonPressed
                ? [
                    //no shadows if button pressed
                  ]
                : [
                    //darker bot right
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(3, 3),
                      blurRadius: 20,
                      //spreadRadius: 1,
                    ),
                    // Top left shadow is lighter
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 10,
                      //spreadRadius: 1,
                    ),
                  ]),
      ),
    );
  }
}
