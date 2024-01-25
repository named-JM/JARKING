import 'package:flutter/material.dart';

class WordleInfo extends StatelessWidget {
  const WordleInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/images/wordle-img/wordle-info.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
