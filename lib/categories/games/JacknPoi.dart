import 'dart:math';

import 'package:flutter/material.dart';

class RPSGame extends StatefulWidget {
  @override
  _RPSHomePageState createState() => _RPSHomePageState();
}

class _RPSHomePageState extends State<RPSGame>
    with SingleTickerProviderStateMixin {
  final List<String> choices = ['Rock', 'Scissors', 'Paper'];
  String userChoice = '';
  String appChoice = '';
  String result = '';
  int userScore = 0;
  int appScore = 0;
  late AnimationController controller;

  String defaultChoice = 'Rock'; // Default choice for the initial image

  Map<String, String> imageMap = {
    'Rock': 'Assets/images/RPS-img/rock.png',
    'Scissors': 'Assets/images/RPS-img/scissors.png',
    'Paper': 'Assets/images/RPS-img/paper.png',
    'Default': 'Assets/images/RPS-img/default.png',
  };

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Set the initial user choice
    appChoice = defaultChoice;
    userChoice = defaultChoice;
    //to sync both
    // Delay the assignment of appChoice to allow the initial 'Default' image to be displayed
    Future.delayed(Duration.zero, () {
      setState(() {
        appChoice = choices[Random().nextInt(choices.length)];
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget getImage(String choice, bool animate) {
    if (choice.isEmpty) {
      return Container(
        width: 250,
        height: 250,
        child: Image.asset(
          imageMap[defaultChoice]!,
        ),
      );
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, sin(controller.value * pi) * 20),
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset(
              imageMap[choice]!,
            ),
          ),
        );
      },
    );
  }

  void playGame(String userChoice) async {
    controller.forward();

    await Future.delayed(Duration(milliseconds: 700));

    setState(() {
      this.appChoice = choices[Random().nextInt(choices.length)];
    });

    // Set the user choice after the animation
    this.userChoice = userChoice;

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

    controller.reverse();

    // Reset choices to 'Rock' after the round
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        this.userChoice = 'Default';
        this.appChoice = 'Default';
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/images/RPS-img/bg-rps.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //-----> USER CHOICE DISPLAY <--------
              SizedBox(height: 45),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    userChoice.isNotEmpty
                        ? getImage(userChoice, true)
                        : Container(),
                    SizedBox(height: 10),
                    getScoreWidget(userScore, 'You'),
                  ],
                ),
              ),

              //----> user choices ROCK PAPER SCISSORS <-----------

              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: choices
                    .map(
                      (choice) => GestureDetector(
                        onTap: () {
                          playGame(choice);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white, // Change the color as needed
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  offset: Offset(2, 2),
                                  //blurRadius: 21
                                  //spreadRadius: 1,
                                ),
                                // Top left shadow is lighter
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-3, -3),
                                  blurRadius: 1,
                                  //spreadRadius: 1,
                                ),
                              ]),
                          child: Text(
                            choice.toUpperCase(),
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight
                                    .bold // Change the text color as needed
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

              //---------> APP(COMPUTER) CHOICE DISPLAY <-----

              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    appChoice.isNotEmpty
                        ? getImage(appChoice, true)
                        : Container(),
                    SizedBox(height: 10),
                    getScoreWidget(appScore, 'Computer'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
