import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 36.0,
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey[900],
                      size: 36.0,
                    ),
                  ],
                ),
              ),
              Text(
                'THIS IS MENU PAGE 4 BOX HERE',
                style: TextStyle(fontSize: 50.0),
              )
            ],
          ),
        ),
      );
}
