import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  // Create a single AudioPlayer instance to manage all sounds
  static final AudioPlayer _player = AudioPlayer();

  void playSound(int noteNumber) async {
    try {
      // Stop any currently playing sound
      await _player.stop();
      
      // Play the new sound
      await _player.play(AssetSource('audio/note$noteNumber.wav'));
      print('Playing note $noteNumber');
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Xylophone'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, noteNumber: 1),
          buildKey(color: Colors.orange, noteNumber: 2),
          buildKey(color: Colors.yellow, noteNumber: 3),
          buildKey(color: Colors.green, noteNumber: 4),
          buildKey(color: Colors.teal, noteNumber: 5),
          buildKey(color: Colors.blue, noteNumber: 6),
          buildKey(color: Colors.purple, noteNumber: 7),
        ],
      ),
    );
  }

  Expanded buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(noteNumber);
        },
        child: const Text(''),
      ),
    );
  }
}