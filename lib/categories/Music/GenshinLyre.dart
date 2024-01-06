import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(GenshinLyre());
}

class GenshinLyre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('21 Rectangles Grid'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0), // Add top padding
          child: RectanglesGrid(),
        ),
      ),
    );
  }
}

class RectanglesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 550.0,
        height: 550.0,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Play sound based on the index
                playSound(index +
                    1); // Index is 0-based, add 1 to match your requirement
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: 70.0,
                height: 70.0,
              ),
            );
          },
          itemCount: 21,
        ),
      ),
    );
  }

  void playSound(int soundNumber) {
    final player = new AudioPlayer();
    player.play(AssetSource('doremi$soundNumber.mp3'));
  }
}