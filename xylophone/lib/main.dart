import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

import 'xylophone.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static AudioCache player = new AudioCache();

  @override
  void initState() {
    super.initState();
    player.loadAll([
      'note1.wav',
      'note2.wav',
      'note3.wav',
      'note4.wav',
      'note5.wav',
      'note6.wav',
      'note7.wav',
    ]);
  }

  playSound(String filename) {
    player.play('$filename.wav');
  }

  Widget build(BuildContext context) {
    Widget xylophoneBar(int bar) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: bar * 10.0),
          child: RaisedButton(
            color: xylophoneBars[bar].barColor,
            onPressed: () => playSound(xylophoneBars[bar].name),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xylophoneBar(0),
              xylophoneBar(1),
              xylophoneBar(2),
              xylophoneBar(3),
              xylophoneBar(4),
              xylophoneBar(5),
              xylophoneBar(6),
            ],
          ),
        ),
      ),
    );
  }
}
