import 'dart:math';

import 'package:flutter/material.dart';

class RPSGame extends StatefulWidget {
  @override
  _RPSHomePageState createState() => _RPSHomePageState();
}

class _RPSHomePageState extends State<RPSGame> {
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
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    getScoreWidget(appScore, 'App'),
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
                    (choice) => ElevatedButton(
                      onPressed: () {
                        playGame(choice);
                      },
                      child: Text(choice),
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
