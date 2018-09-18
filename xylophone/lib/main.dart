import 'package:flutter/material.dart';
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
  playSound(String filename) {}

  Widget build(BuildContext context) {
    Widget xylophoneBar(int bar) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: bar * 10.0),
        child: RaisedButton(
          color: xylophoneBars[bar].barColor,
          onPressed: () => playSound(xylophoneBars[bar].name),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            xylophoneBar(1),
            xylophoneBar(2),
            xylophoneBar(3),
            xylophoneBar(4),
            xylophoneBar(5),
            xylophoneBar(6),
            xylophoneBar(7),
          ],
        ),
      ),
    );
  }
}
