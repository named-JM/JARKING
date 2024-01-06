import 'dart:math';

import 'package:flutter/material.dart';

class RPSGame extends StatefulWidget {
  @override
  _RPSGameState createState() => _RPSGameState();
}

class _RPSGameState extends State<RPSGame> {
  final List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String userChoice = '';
  String appChoice = '';
  String result = '';
  int userScore = 0;
  int appScore = 0;

  Map<String, String> imageMap = {
    'Rock': 'Assets/images/RPS-img/rock.png', // Replace with your image paths
    'Paper': 'Assets/images/RPS-img/paper.png',
    'Scissors': 'Assets/images/RPS-img/scissors.png',
  };

  void playGame(String userChoice) {
    setState(() {
      this.userChoice = userChoice;
      this.appChoice = choices[Random().nextInt(choices.length)];

      if (this.userChoice == this.appChoice) {
        result = 'It\'s a draw!';
      } else if ((this.userChoice == 'Rock' && this.appChoice == 'Scissors') ||
          (this.userChoice == 'Paper' && this.appChoice == 'Rock') ||
          (this.userChoice == 'Scissors' && this.appChoice == 'Paper')) {
        result = 'You win!';
        userScore++;
      } else {
        result = 'You lose!';
        appScore++;
      }

      if (userScore == 5 || appScore == 5) {
        if (userScore == 5) {
          result = 'Congratulations! You won the game!';
        } else {
          result = 'Sorry! You lost the game!';
        }
        userScore = 0;
        appScore = 0;
      }
    });
  }

  Widget getScoreWidget(int score, String label) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              index < score ? Icons.star : Icons.star_border,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget getImage(String choice) {
    return Image.asset(
      imageMap[choice]!,
      width: 100,
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    userChoice.isNotEmpty ? getImage(userChoice) : Container(),
                    SizedBox(height: 10),
                    getScoreWidget(userScore, 'You'),
                  ],
                ),
                SizedBox(width: 20),
                Text(
                  'vs',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    appChoice.isNotEmpty ? getImage(appChoice) : Container(),
                    SizedBox(height: 10),
                    getScoreWidget(appScore, 'Computer'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Text(
              'Choose your move:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices
                  .map(
                    (choice) => GestureDetector(
                      onTap: () {
                        playGame(choice);
                      },
                      child: Container(
                        width: 80, // Set the width as needed
                        height: 40, // Set the height as needed
                        decoration: BoxDecoration(
                            color: Colors.grey[200], // Set the background color
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              //bottom right shadow is darker
                              BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(5, 5),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),

                              //top left shadow is lighter
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ] // Set border radius as needed
                            ),
                        child: Center(
                          child: Text(
                            choice,
                            style: TextStyle(
                              color: Colors.black, // Set the text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              '$result',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
