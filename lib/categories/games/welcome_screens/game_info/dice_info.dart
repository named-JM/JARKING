import 'package:flutter/material.dart';

class DiceGameInfo extends StatelessWidget {
  const DiceGameInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/images/Dices/DICE_info.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
