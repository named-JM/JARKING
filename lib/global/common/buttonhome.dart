// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final onTap;
  bool isButtonPressed;

  //create constructor for thi s one
  CheckoutButton({this.onTap, required this.isButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), //<--- to make it smoother
        height: 50,
        width: 300,
        child: Center(
            child: Text(
          "Checkout our Group",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isButtonPressed ? Colors.grey[600] : Colors.black),
        )),
        // child: Icon(
        //   Icons.favorite,
        //   size: 60,
        //   color: Colors.red,
        // ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: isButtonPressed
                ? [
                    //no shadows if button pressed
                  ]
                : [
                    //darker bot right
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(5, 5),
                      blurRadius: 20,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-10, -7),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]),
      ),
    );
  }
}
