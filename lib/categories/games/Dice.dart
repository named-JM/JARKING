import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/dicebutton.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late AudioPlayer player; // Declare AudioPlayer instance

  int diceNumber = 1;
  int userGuess = 1;
  int selectedDice = 0; // Added variable to track the selected dice number
  bool isRollPressed = false;

  void rollPressed() {
    setState(() {
      if (isRollPressed == false) {
        isRollPressed = true;

        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            isRollPressed = false;
            return rollDice();
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 1000), // Adjust the duration as needed
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Use a different curve for smoother motion
      ),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // Use a different curve for smoother motion
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          diceNumber = Random().nextInt(6) + 1;
        });
        _animationController.reset();
        checkWin();
      }
    });
  }

  void rollDice() {
    if (_animationController.isAnimating) return;
    _animationController.forward();

    //sound of rolling dice
    player = AudioPlayer(); // Initialize the class variable
    player.play(AssetSource('roll-dice-sound.mp3'));
  }

  void checkWin() {
    if (userGuess == diceNumber) {
      showWinDialog();
    } else {
      showLoseDialog();
    }
  }

  void showWinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WOW!'),
          content: Text('Amazing! You win!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showLoseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WRONG!'),
          content: Text('Sorry you guess it wrong. Try again!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/images/Dices/DICE.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //---->DISPLAY TEXT YOUR GUESS <-------
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   child: Center(
            //     child: Text(
            //       'Your Guess: $userGuess',
            //       style: const TextStyle(fontSize: 30.0),
            //     ),
            //   ),
            // ),
            SizedBox(height: 60),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 150.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //-----> 1ST ROW DICES <-------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildDiceButton(1),
                        buildDiceButton(2),
                        buildDiceButton(3),
                      ],
                    ),
                    //------> 2ND ROW DICES <------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildDiceButton(4),
                        buildDiceButton(5),
                        buildDiceButton(6),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      child: RollButton(
                          onTap: rollPressed, isRollPressed: isRollPressed),
                    ),
                  ],
                ),
              ),
            ),

            //---->RESULT
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Result:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 10.0),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: Image.asset(
                        'Assets/images/Dices/dice_${diceNumber.toString()}.png', // Convert diceNumber to string
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  void tapDiceButton() {
    // Play sound when tapping a dice button
    player = AudioPlayer(); // Initialize the class variable
    player.play(AssetSource('click.mp3'));
  }

  GestureDetector buildDiceButton(int number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          userGuess = number;
          selectedDice = number;
          tapDiceButton();
        });
      },
      child: Transform.scale(
        scale: selectedDice == number ? 0.8 : 1.0, // Shrink effect
        child: Image.asset(
          'Assets/images/Dices/dice_$number.png',
          width: 80.0,
          height: 80.0,
        ),
      ),
    );
  }
}
