import 'dart:math';

class WordleGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = [
    "about",
    "apple",
    "array",
    "beach",
    "bread",
    "brain",
    "build",
    "built",
    "bitch",
    "chair",
    "class",
    "click",
    "corny",
    "crime",
    "crown",
    "daddy",
    "dance",
    "death",
    "deads",
    "doors",
    "earth",
    "fight",
    "fries",
    "grape",
    "gravy",
    "guess",
    "happy",
    "honey",
    "horny",
    "laser",
    "leave",
    "magic",
    "melon",
    "noble",
    "night",
    "plane",
    "plain",
    "proud",
    "pussy",
    "quick",
    "rider",
    "river",
    "rival",
    "robot",
    "shape",
    "share",
    "seven",
    "serve",
    "smile",
    "story",
    "tiger",
    "table",
    "three",
    "train",
    "valid",
    "video",
    "voice",
    "vital",
    "waste",
    "wheel",
    "whale",
    "whole",
    "woman",
    "world",
    "wound",
    "write",
    "wrote",
    "yield",
    "zebra"
  ];
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
