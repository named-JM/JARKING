import 'package:flutter/material.dart';

class SpinWheel extends StatelessWidget {
  const SpinWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Spin the Wheel'),
      ),
      body: Center(
          child: Text(
        'Spin The Wheel',
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
