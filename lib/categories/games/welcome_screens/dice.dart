import 'package:audioplayers/audioplayers.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/Dice.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/exit_button.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/game_info/dice_info.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/new_button.dart';
import 'package:flutter/material.dart';

class WelcomeDice extends StatefulWidget {
  const WelcomeDice({Key? key}) : super(key: key);

  @override
  State<WelcomeDice> createState() => _WelcomeDiceState();
}

class _WelcomeDiceState extends State<WelcomeDice> {
  late AudioPlayer player; // Declare AudioPlayer instance

  bool isButtonPressed = false;
  bool isExitButtonPressed = false;

  void buttonPressed() {
    setState(() {
      player = AudioPlayer(); // Initialize the class variable
      player.play(AssetSource('mech-tap.mp3'));

      if (isButtonPressed == false) {
        isButtonPressed = true;

        // Set isButtonPressed to false after a delay of 300 milliseconds
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            isButtonPressed = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DiceGame()),
            );
            player.stop();
          });
        });
      }
    });
  }

  // Function to show the game information dialog
  void showGameInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child:
              DiceGameInfo(), // You can replace this with the content of your game information
        );
      },
    );
  }

  void exitbuttonPressed() {
    setState(() {
      player = AudioPlayer(); // Initialize the class variable
      player.play(AssetSource('pop.mp3'));

      if (isExitButtonPressed == false) {
        isExitButtonPressed = true;

        // Set isButtonPressed to false after a delay of 300 milliseconds
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            isExitButtonPressed = false;
            Navigator.pop(context);
            player.stop();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/images/welcome-screens/dice.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: NewButton(
                  onTap: buttonPressed,
                  isButtonPressed: isButtonPressed,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 5.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(167, 255, 255, 255), size: 32.0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
              bottom: 16.0,
              left: 10,
              child: ExitButton(
                  onTap: exitbuttonPressed,
                  isExitButtonPressed: isExitButtonPressed)),
          // Add an IconButton at the bottom right to show game information
          Positioned(
            bottom: 3.0,
            right: 3.0,
            child: IconButton(
              icon: Icon(Icons.info),
              color: Colors.black,
              iconSize: 46.5,
              onPressed: () {
                // Call the function to show the game information dialog
                showGameInfoDialog();
              },
            ),
          ),
        ],
      ),
    );
  }
}
