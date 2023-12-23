import 'package:flutter/material.dart';

class ColorGame extends StatelessWidget {
  const ColorGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is color game'),
        backgroundColor: Colors.grey,
      ),
      body: Text('This is Color game page'),
    );
  }
}
