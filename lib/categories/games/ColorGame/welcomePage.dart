import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'colorGambleGame.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> backgroundAnimation;

  late AudioPlayer player; // Declare AudioPlayer instance

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust the duration as needed
    );

    backgroundAnimation = controller.drive(
      ColorTween(
        begin: Color.fromARGB(255, 134, 122, 222),
        end: Color.fromARGB(255, 231, 50, 4),
      ),
    );

    controller.repeat(
        reverse:
            true); // Reversing the animation to smoothly transition back and forth
    // Initialize AudioPlayer and load the audio fileS
    player = new AudioPlayer(); // Initialize the class variable
    player.play(AssetSource('panic.mp3'));
    // Start playing the background music when the screen is loaded

    // Uncomment the line below if you want to start the animation immediately when the screen is loaded
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    player.dispose(); // Dispose of the AudioPlayer instance
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: backgroundAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  backgroundAnimation.value!,
                  Color.fromARGB(
                      255, 157, 0, 255), // You can set another color if needed
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ColorGambleGame()),
                      );
                    },
                    child: Image.asset(
                      'Assets/images/ColorGame-img/play.png',
                      width: 200,
                      height: 130,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      player.stop(); // Stop the audio playback
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'Assets/images/ColorGame-img/exit.png',
                      width: 150,
                      height: 75,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
