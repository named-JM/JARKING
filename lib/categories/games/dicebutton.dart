// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RollButton extends StatelessWidget {
  final onTap;
  bool isRollPressed;
  RollButton({this.onTap, required this.isRollPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), //<--- to make it smoother
        height: 50,
        width: 150,
        child: Center(
            child: Text(
          "ROLL",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isRollPressed ? Colors.grey[600] : Colors.black),
        )),
        // child: Icon(
        //   Icons.favorite,
        //   size: 60,
        //   color: Colors.red,
        // ),
        decoration: BoxDecoration(
            color: isRollPressed ? Colors.white : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: isRollPressed
                ? [
                    //no shadows if button pressed
                  ]
                : [
                    //darker bot right
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(6, 6),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                    //lighter top left
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]),
      ),
    );
  }
}
