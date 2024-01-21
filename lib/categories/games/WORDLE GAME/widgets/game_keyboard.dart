// ignore_for_file: must_be_immutable

import 'package:final_project_for_flutter_by_jarling/categories/games/WORDLE%20GAME/utils/game_provider.dart';
import 'package:final_project_for_flutter_by_jarling/categories/games/WORDLE%20GAME/widgets/game_board.dart';
import 'package:flutter/material.dart';

class GameKeyboard extends StatefulWidget {
  GameKeyboard(this.game, {Key? key}) : super(key: key);
  WordleGame game;
  @override
  State<GameKeyboard> createState() => _GameKeyboardState();
}

class _GameKeyboardState extends State<GameKeyboard> {
  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //MESSAGE HIDDEN/SHOW UP BELOW AT THE WORDLE TITLE
        Text(
          WordleGame.game_message,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 20.0),
        GameBoard(widget.game),
        SizedBox(
          height: 40.0,
        ),

        //---->CALLING ROW SECTION<------
        Row(
          // ROW 1
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0),
        //ROW 2 <------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if (widget.game.letterId < 5) {
                  print(widget.game.rowId);
                  widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                  widget.game.letterId++;
                  setState(() {});
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0),
        //ROW 3 <----------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                //HERE DELETER BUTTON LOGICSD HERE <---
                if (e == "DEL") {
                  if (widget.game.letterId > 0) {
                    setState(() {
                      widget.game
                          .insertWord(widget.game.letterId - 1, Letter("", 0));
                      widget.game.letterId--;
                    });
                  }
                  //SUBMIT LOGIC BUTOON HERE!!!!!
                } else if (e == "SUBMIT") {
                  // setting the game rules
                  if (widget.game.letterId >= 5) {
                    String guess = widget.game.wordleBoard[widget.game.rowId]
                        .map((e) => e.letter)
                        .join();
                    print(guess);
                    print(WordleGame.game_guess == guess);
                    if (widget.game.checkWordExist(guess.toLowerCase())) {
                      if (guess == WordleGame.game_guess) {
                        // Check if the user won in less than 5 words
                        if (widget.game.rowId < 5) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Congratulations!"),
                                content: Text(
                                  "You guessed the correct word in just ${widget.game.rowId + 1} word guesses!",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Reset the game state and close the dialog
                                      setState(() {
                                        widget.game.reset();
                                        WordleGame.game_message = "";
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Restart"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {
                          WordleGame.game_message = "Congratulations🎉";
                          widget.game.wordleBoard[widget.game.rowId]
                              .forEach((element) {
                            element.code = 1;
                          });
                        });
                      } else {
                        print(WordleGame.game_guess);
                        int listLength = guess.length;
                        for (int i = 0; i < listLength; i++) {
                          String char = guess[i].toUpperCase();
                          print(
                              "the test: ${WordleGame.game_guess.contains(char)}");
                          if (WordleGame.game_guess.contains(char)) {
                            if (WordleGame.game_guess[i] == char) {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 1;
                              });
                            } else {
                              setState(() {
                                print(char);
                                widget.game.wordleBoard[widget.game.rowId][i]
                                    .code = 2;
                              });
                            }
                          }
                        }
                        widget.game.rowId++;
                        widget.game.letterId = 0;
                      }
                    }

                    if (widget.game.rowId >= 5) {
                      // Check if the user has submitted 5 words and show a losing message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Game Over"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "You have reached the maximum number of submissions. You lose!",
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Correct guess: ${WordleGame.game_guess}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Reset the game state and close the dialog
                                  setState(() {
                                    widget.game.reset();
                                    WordleGame.game_message = "";
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: Text("Restart"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      WordleGame.game_message =
                          "the world does not exist try again";
                    }
                  }
                } else {
                  if (widget.game.letterId < 5) {
                    print(widget.game.rowId);
                    widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                    widget.game.letterId++;
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300,
                ),
                child: Text(
                  "${e}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
