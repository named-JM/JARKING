// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MeetourTeamButton extends StatelessWidget {
  final onTap;
  bool isButtonPressed;

  //create constructor for thi s one
  MeetourTeamButton({this.onTap, required this.isButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), //<--- to make it smoother
        // height: 50,
        // width: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          boxShadow: isButtonPressed
              ? []
              : [
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
                ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '',
              style: TextStyle(fontSize: 18.0),
            ),
            Icon(
              Icons.arrow_forward,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
