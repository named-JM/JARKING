import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatelessWidget {
  //AUDIPLAYER CODE HERE
  //we are coding this method para di na pauli uli every textbutton
  void playSound(int soundNumber) {
    final player = new AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  //displaying the color buttons to be pressed here
  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          //calling the playsound method so if it pressed the function of playsound will be played
          playSound(soundNumber);
        },
        //adding this would make the colors appear!hihi
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        //instead of using child: text() we go child:Container.
        //it doesnt matter what property of child it is but we are needing child for textbutton to make it happen
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // here comes the expanded buildkey(required Color color, required int soundNumber)
            buildKey(color: Colors.red.shade900, soundNumber: 1),
            buildKey(color: Colors.orange.shade900, soundNumber: 2),
            buildKey(color: Colors.yellow.shade900, soundNumber: 3),
            buildKey(color: Colors.green.shade900, soundNumber: 4),
            buildKey(color: Colors.purple.shade900, soundNumber: 5),
            buildKey(color: Colors.indigo.shade900, soundNumber: 6),
            buildKey(color: Colors.blue.shade900, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
