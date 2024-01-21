import 'dart:math';

import 'package:final_project_for_flutter_by_jarling/categories/games/WORDLE%20GAME/utils/list_words.dart';

class WordleGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = WordList.word_list;
  static bool gameOver = false;
  //setting the game row
  static List<Letter> wordleRow = List.generate(
    5,
    (index) => Letter("", 0),
  );

  //Setting the gameBoard
  List<List<Letter>> wordleBoard = List.generate(
      5,
      (index) => List.generate(
            5,
            (index) => Letter("", 0),
          ));

  //Setting the Game Functon
  void passTry() {
    rowId++;
    letterId = 0;
  }

  static void initGame() {
    final random = new Random();
    int index = random.nextInt(word_list.length);
    game_guess = word_list[index].toUpperCase();
  }

  //Setting the game insertion
  void insertWord(index, word) {
    wordleBoard[rowId][index] = word;
  }

  //checking world
  bool checkWordExist(String word) {
    return word_list.contains(word);
  }

  void reset() {
    rowId = 0;
    letterId = 0;
    wordleBoard =
        List.generate(5, (index) => List.generate(5, (index) => Letter("", 0)));
    return initGame();
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}
