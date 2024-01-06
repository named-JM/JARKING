import 'package:flutter/material.dart';

class HabitTrack extends StatelessWidget {
  const HabitTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('HABIT TRACKER'),
      ),
      body: Center(
        child: Text(
          'HABIT TRACKER/MAYBE/MAYBE NOT',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
