import 'package:audioplayers/audioplayers.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/WORDLE%20GAME/screens/game_screen.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/exit_button.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/welcome_screens/new_button.dart';
import 'package:flutter/material.dart';

class WelcomeWordle extends StatefulWidget {
  const WelcomeWordle({Key? key}) : super(key: key);

  @override
  State<WelcomeWordle> createState() => _WelcomeWordleState();
}

class _WelcomeWordleState extends State<WelcomeWordle> {
  late AudioPlayer player; // Declare AudioPlayer instance

  bool isButtonPressed = false;
  bool isExitButtonPressed = false;

  void buttonPressed() {
    setState(() {
      player = AudioPlayer();
      player.play(AssetSource('tap.mp3'));

      if (isButtonPressed == false) {
        isButtonPressed = true;

        // Set isButtonPressed to false after a delay of 300 milliseconds
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            isButtonPressed = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen()),
            );
            player.stop();
          });
        });
      }
    });
  }

  void exitbuttonPressed() {
    setState(() {
      player = AudioPlayer();
      player.play(AssetSource('tap.mp3'));

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
                image: AssetImage("Assets/images/welcome-screens/DICE(1).png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: NewButton(
                onTap: buttonPressed,
                isButtonPressed: isButtonPressed,
              ),
            ),
          ),
          Positioned(
              bottom: 16.0,
              left: 10,
              child: ExitButton(
                  onTap: exitbuttonPressed,
                  isExitButtonPressed: isExitButtonPressed))
        ],
      ),
    );
  }
}
