import 'package:flutter/material.dart';

class DiceGame extends StatelessWidget {
  const DiceGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Dice Game'),
      ),
    );
  }
}
