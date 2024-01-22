import 'package:final_project_for_flutter_by_jarling/categories/games/ColorGame/welcomePage.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/dice.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/rps.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/wordle.dart';
import 'package:flutter/material.dart';

class GamesMenu extends StatelessWidget {
  const GamesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      // Add other icons or widgets here
                      //add icons or something
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Games',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeRPS()));
                      },
                      child: Center(
                          child: RoundedBox(
                        label: 'ROCK\nPAPER\nSCISSORS',
                      )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeDice()));
                      },
                      child: RoundedBox(label: 'DICE GAME'),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeWordle()));
                      },
                      child: Center(child: RoundedBox(label: 'WORDLE')),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      },
                      child: RoundedBox(label: 'COLOR GAME'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedBox extends StatelessWidget {
  final String label;

  RoundedBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: 140.0,
      height: 140.0,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            //bottom right shadow is darker
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(5, 5),
              blurRadius: 20,
              spreadRadius: 1,
            ),

            //top left shadow is lighter
            BoxShadow(
              color: Colors.white,
              offset: Offset(-10, -7),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ]),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
          textAlign: TextAlign.center, // Align text to the center
        ),
      ),
    );
  }
}
