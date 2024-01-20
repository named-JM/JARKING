import 'dart:math';

class WordleGame {
  //setting the game variables
  int rowId = 0;
  int letterId = 0;
  static String game_message = "";
  static String game_guess = "";
  static List<String> word_list = [
    "bitch",
    "fight",
    "brain",
    "plane",
    "earth",
    "robot",
    "array",
    "plain",
    "floor",
    "daddy",
    "about",
    "bread",
    "honey",
    "build",
    "chair",
    "death",
    "click",
    "class",
    "beach",
    "pussy",
    "dance",
    "corny",
    "built",
    "crime",
    "crown",
    "guess",
    "world",
    "gravy",
    "night",
    "leave",
    "rival",
    "proud",
    "fries",
    "fried",
    "horny",
    "valid",
    "write",
    "seven",
    "serve",
    "share",
    "shape",
    "voice",
    "vital",
    "video",
    "valid",
    "yield",
    "wrote",
    "write",
    "wheel",
    "train",
    "woman",
    "whole",
    "whale",
    "waste",
    "three",
    "wound",
    "story",
    ""
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
    // You may need to initialize other game state variables based on your implementation
  }
}

class Letter {
  String? letter;
  int code = 0;

  Letter(this.letter, this.code);
}
