import 'package:flutter/material.dart';

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('YOUR BMI'),
      ),
      body: Center(
          child: Text(
        'YOUR BMI',
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
