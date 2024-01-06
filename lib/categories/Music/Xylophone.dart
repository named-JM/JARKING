import 'package:flutter/material.dart';

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('XYLOPHONE'),
      ),
      body: Center(
        child: Text(
          'XYLOPHONE',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
