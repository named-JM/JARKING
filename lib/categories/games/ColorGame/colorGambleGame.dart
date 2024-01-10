import 'dart:math';

import 'package:final_project_for_flutter_by_jarling/categories/games/ColorGame/welcomePage.dart';
import 'package:flutter/material.dart';

class ColorGambleGame extends StatefulWidget {
  const ColorGambleGame({super.key});

  @override
  State<ColorGambleGame> createState() => _ColorGambleGameState();
}

class _ColorGambleGameState extends State<ColorGambleGame> {
  bool canProceed = true;
  List<Map<Color, int>> selectedColors = [];
  List<Color> options = [
    Colors.red.shade900,
    Colors.deepPurple.shade300,
    Color.fromARGB(255, 255, 238, 0),
    Color.fromARGB(255, 33, 29, 29),
    const Color.fromARGB(255, 239, 35, 103),
    const Color.fromARGB(255, 98, 176, 39),
  ];

  List<Color> randomColors = [];

  bool showOutcome = false;
  bool optionsClickable = true;
  bool resultShown = false;
  bool gameInProgress = true;
  int coins = 50;
  int betAmount = 0;
  bool betLocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/images/ColorGame-img/green.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ),
                          );
                        },
                        iconSize: 40.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.info,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showInstructionGame(context);
                            },
                            iconSize: 40.0,
                          ),
                          Image.asset(
                            'Assets/images/ColorGame-img/coin.png',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '$coins',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  if (showOutcome) ...[
                    buildRandomColors(),
                    SizedBox(height: 20),
                    buildOutcome(),
                    SizedBox(height: 20),
                  ],
                  SizedBox(
                    height: 10,
                  ),
                  buildOptions(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedColors.isNotEmpty &&
                          !resultShown &&
                          gameInProgress &&
                          canProceed) {
                        checkOutcome();
                        setState(() {
                          resultShown = true;
                          gameInProgress = false;
                          betLocked = true;
                        });
                      } else if (betAmount > coins) {
                        showNotEnoughCoinsAlert();
                        setState(() {
                          canProceed = false;
                        });
                      } else {
                        return;
                      }
                    },
                    child: Text('BET',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            canProceed ? Colors.white : Colors.grey,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (coins == 0) {
                            showZeroCoinsAlert();
                          } else {
                            setState(() {
                              selectedColors.clear();
                              showOutcome = false;
                              optionsClickable = true;
                              resultShown = false;
                              gameInProgress = true;
                              betLocked = false;
                              canProceed = true;
                            });
                          }
                        },
                        child: Text(
                          'ROLL',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                canProceed ? Colors.white : Colors.grey,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24)),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'YOUR BET: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 80,
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              enabled: coins > 0 && !betLocked,
                              onChanged: (value) {
                                if (!betLocked && value.isNotEmpty) {
                                  int newBet = int.parse(value);
                                  setState(() {
                                    betAmount = min(max(newBet, 1), coins);
                                    canProceed = betAmount <= coins;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: '0',
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOptions() {
    int totalBetAmount = selectedColors.fold(0, (sum, colorMap) {
      return sum + colorMap.values.first;
    });
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            Color color = options[index];
            int selectedBetAmount = 0;

            if (selectedColors.isNotEmpty) {
              for (var selectedColor in selectedColors) {
                if (selectedColor.containsKey(color)) {
                  selectedBetAmount = selectedColor[color]!;
                  break;
                }
              }
            }

            return GestureDetector(
              onTap: () {
                if (optionsClickable && gameInProgress && betAmount <= coins) {
                  setState(() {
                    if (selectedColors
                        .map((selectedColor) =>
                            selectedColor.keys.contains(color))
                        .contains(true)) {
                      selectedColors
                          .removeWhere((element) => element.containsKey(color));
                    } else {
                      if (betAmount + selectedColors.length * betAmount <=
                          coins) {
                        selectedColors.add({color: betAmount});
                      } else {
                        showExceedCoins();
                      }
                    }
                    showOutcome = false;
                  });
                }
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    selectedColors
                            .map((selectedColor) =>
                                selectedColor.keys.contains(color))
                            .contains(true)
                        ? Icon(
                            Icons.circle_rounded,
                            color: Colors.amber.shade400,
                            size: 40,
                          )
                        : SizedBox.shrink(),
                    if (selectedColors
                        .map((selectedColor) =>
                            selectedColor.keys.contains(color))
                        .contains(true))
                      Text(
                        '$selectedBetAmount',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Text(
          'Total Bet: ${totalBetAmount}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  void generateRandomColors() {
    randomColors = List.generate(3, (index) {
      return options[Random().nextInt(options.length)];
    });
  }

  void checkOutcome() {
    generateRandomColors();

    Map<Color, int> wonCoinsMap = {};
    Map<Color, int> lostCoinsMap = {};

    for (var selectedColor in selectedColors) {
      Color color = selectedColor.keys.first;
      int betAmount = selectedColor[color]!;
      int wonCoins = betAmount * (randomColors.contains(color) ? 1 : 0);
      int lostCoins = betAmount - wonCoins;

      wonCoinsMap[color] = wonCoins;
      lostCoinsMap[color] = lostCoins;
    }

    if (betAmount > coins) {
      showNotEnoughCoinsAlert();
      return;
    }

    setState(() {
      coins += wonCoinsMap.values.reduce((a, b) => a + b) -
          lostCoinsMap.values.reduce((a, b) => a + b);
      coins = max(0, coins);
      showOutcome = true;
    });

    print(
        'coins: $coins, totalWonCoins: ${wonCoinsMap.values.reduce((a, b) => a + b)}, totalLostCoins: ${lostCoinsMap.values.reduce((a, b) => a + b)}');
  }

  String calculateWinningAmount() {
    int totalWonCoins = 0;
    int totalLostCoins = 0;

    for (var selectedColor in selectedColors) {
      Color color = selectedColor.keys.first;
      int betAmount = selectedColor[color]!;

      if (randomColors.contains(color)) {
        totalWonCoins += betAmount;
      } else {
        totalLostCoins += betAmount;
      }
    }

    String winMessage = totalWonCoins > 0 ? '$totalWonCoins coin(s)' : '';
    String loseMessage =
        totalLostCoins > 0 ? ' but Lost $totalLostCoins coin(s)' : '';

    return '$winMessage$loseMessage';
  }

  Widget buildRandomColors() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: randomColors
          .map(
            (color) => Container(
              width: 80,
              height: 80,
              color: color,
            ),
          )
          .toList(),
    );
  }

  Widget buildOutcome() {
    return resultShown
        ? Column(
            children: [
              SizedBox(height: 10),
              Text(
                randomColors.any((color) => selectedColors
                        .map((selectedColor) =>
                            selectedColor.keys.contains(color))
                        .contains(true))
                    ? 'You Win ${calculateWinningAmount()}'
                    : 'You Lose! [-${betAmount * selectedColors.length}]',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          )
        : Container();
  }

  Future<void> showZeroCoinsAlert() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Restart'),
          content: Text('Your coins are 0. You cannot restart the game.'),
          actions: [
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

  Future<void> showNotEnoughCoinsAlert() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Insufficient Coins'),
          content: Text('You do not have enough coins to bet that amount.'),
          actions: [
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

    if (betAmount > coins) {
      setState(() {
        selectedColors.clear();
        showOutcome = false;
        optionsClickable = true;
        resultShown = false;
        gameInProgress = true;
        betLocked = false;
      });
    }
  }

  void showInstructionGame(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Game Instructions',
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.amber.shade600,
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            '[ROLL] Button - After Betting [BET] You will need to click this if you want to BET AGAIN\n'
            '\n[BET] Button - After Choosing a Colors and Decide how much coins you bet, you will click this to [BET] show result'
            '\n\n[YOUR BET] - Here you will actually enter how many you will be betting.'
            '\n\n\n\nThis Game was made by Wani Games'
            '\nWani Games is actually from my nickname Joanna!'
            '\n\n\n\n                             Also I made that Logo ~ '
            '\n                            Tehe! Happy Gambling!',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
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

  void showExceedCoins() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cannot Select More Boxes'),
          content: Text('BAWAL UTANG DITO!!!!!!!!!!!!'),
          actions: [
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
}
