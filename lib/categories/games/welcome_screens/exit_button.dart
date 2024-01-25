// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final onTap;
  bool isExitButtonPressed;

  //create constructor for thi s one
  ExitButton({this.onTap, required this.isExitButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), //<--- to make it smoother
        height: 40,
        width: 40,
        // child: Center(
        //     child: Text(
        //   "PLAY",
        //   style: TextStyle(
        //       fontSize: 60,
        //       fontWeight: FontWeight.w900,
        //       color: isButtonPressed ? Colors.grey[600] : Colors.black),
        // )),
        child: Icon(
          Icons.exit_to_app_outlined,
          size: 25,
          color: isExitButtonPressed ? Colors.red : Colors.black,
        ),
        decoration: BoxDecoration(
            color: isExitButtonPressed ? Colors.red[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(50),
            boxShadow: isExitButtonPressed
                ? [
                    //no shadows if button pressed
                  ]
                : [
                    //darker bot right
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                    ),
                    //lighter top left
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-1, -1),
                    ),
                  ]),
      ),
    );
  }
}
