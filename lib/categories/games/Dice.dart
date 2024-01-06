import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int diceNumber = 1; // Initialize with a default value
  int userGuess = 1; // Initialize userGuess to prevent null error
  int score = 20;
  int winCount = 0;

  void rollDice() {
    setState(() {
      diceNumber =
          Random().nextInt(6) + 1; // Generates a random number between 1 and 6
      calculateScore();
    });
  }

  void calculateScore() {
    if (userGuess == diceNumber) {
      score += 10; // Award 10 points for an exact match
      winCount++;
    } else {
      score -= 5; // Deduct 1 point for an incorrect guess
    }

    if (score <= 0) {
      showGameOverDialog();
    } else if (winCount >= 5) {
      showGameWonDialog();
    }
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You lost! Your score is $score.'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void showGameWonDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You won the game! Your score is $score.'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      score = 0;
      winCount = 0;
      userGuess = 1;
      diceNumber = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Dice Game'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                'Your Guess: $userGuess',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDiceButton(1),
                      buildDiceButton(2),
                      buildDiceButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDiceButton(4),
                      buildDiceButton(5),
                      buildDiceButton(6),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Column(
              children: [
                Text(
                  'Result:',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Image.asset(
                  'Assets/images/Dices/dice_$diceNumber.png',
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Score: $score',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              rollDice();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
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
                  ]

                  /// Set border radius as needed
                  ),
              child: Center(
                child: Text(
                  'Roll the Dice',
                  style: TextStyle(
                    color: Colors.black, // Set the text color
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  GestureDetector buildDiceButton(int number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          userGuess = number;
        });
      },
      child: Image.asset(
        'Assets/images/Dices/dice_$number.png',
        width: 80.0,
        height: 80.0,
      ),
    );
  }
}
