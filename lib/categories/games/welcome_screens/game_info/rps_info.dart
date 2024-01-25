import 'package:flutter/material.dart';

class RPSGameInfo extends StatelessWidget {
  const RPSGameInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/images/RPS-img/rps-info2.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
