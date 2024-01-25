import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GenshinLyre());
}

class GenshinLyre extends StatefulWidget {
  @override
  _GenshinLyreState createState() => _GenshinLyreState();
}

class _GenshinLyreState extends State<GenshinLyre> {
  // List of chord image paths
  final List<String> chordImages = [
    'Assets/images/chords/do.png',
    'Assets/images/chords/re.png',
    'Assets/images/chords/mi.png',
    'Assets/images/chords/fa.png',
    'Assets/images/chords/sol.png',
    'Assets/images/chords/la.png',
    'Assets/images/chords/ti.png',
  ];

  // List to track the state of each circle's color
  List<Color> circleColors = List.generate(21, (index) => Colors.grey.shade300);

  @override
  Widget build(BuildContext context) {
    // Ensure landscape orientation when navigating to this page
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return WillPopScope(
      onWillPop: () async {
        // Set preferred orientations back to portrait when leaving the page
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //         'Assets/images/playing-lyre.gif'), // Replace with your background image path
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.portraitDown,
                        ]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "GENSHIN LYRE SIMULATION",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: 550.0,
                        height: 300,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Play sound based on the index
                                playSound(index +
                                    1); // Index is 0-based, add 1 to match your requirement

                                // Update the color of the clicked circle
                                setState(() {
                                  circleColors[index] = Colors.grey
                                      .shade100; // Change this to the desired color
                                });

                                // Reset the color after a brief delay (you can adjust the duration as needed)
                                Future.delayed(Duration(milliseconds: 500), () {
                                  setState(() {
                                    circleColors[index] = Colors.grey.shade300;
                                  });
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: circleColors[index],
                                      borderRadius: BorderRadius.circular(50.0),
                                      boxShadow: [
                                        // Bottom right shadow is darker
                                        BoxShadow(
                                          color: Colors.grey.shade500,
                                          offset: Offset(5, 5),
                                          blurRadius: 20,
                                          spreadRadius: 1,
                                        ),
                                        // Top left shadow is lighter
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-5, -5),
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    chordImages[index %
                                        chordImages
                                            .length], // Use modulo to repeat images if there are fewer than 21
                                    width: 40.0,
                                    height: 40.0,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 21,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//when it comes to problem in assets but the pubspec is good and directories is good. it is much cause of that mfker audio bundle file. find that assets/sounds/
  void playSound(int soundNumber) {
    final player = new AudioPlayer();
    player.play(AssetSource('doremi$soundNumber.mp3'));
  }
}
