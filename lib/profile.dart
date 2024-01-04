import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Text(
            'This is Profile Page',
            style: TextStyle(fontSize: 120),
          ),
        ),
      );
}
