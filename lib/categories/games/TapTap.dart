import 'package:flutter/material.dart';

class TapGame extends StatelessWidget {
  const TapGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('TAP TAP GAME'),
      ),
      body: Center(
          child: Text(
        'TAP TAP GAME',
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
