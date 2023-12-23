import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //deisgining the button png
      padding: EdgeInsets.all(20), //all spaces between border box and image
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
