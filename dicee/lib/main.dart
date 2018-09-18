import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(DiceeApp());

const burntOrange = Color.fromARGB(255, 255, 147, 0);
const buttonTextStyle = TextStyle(
    fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w300, fontSize: 40.0);

class DiceeApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  num dice1 = 1;
  num dice2 = 1;

  final random = Random();

  void updateDiceImages() {
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
    });
  }

  Widget build(BuildContext context) {
    Widget diceeLogo() {
      return Image.asset(
        'assets/diceeLogo@2x.png',
        fit: BoxFit.scaleDown,
        width: 240.0,
      );
    }

    Widget showDie(num dots) {
      return Image.asset(
        'assets/dice$dots@2x.png',
        width: 100.0,
        height: 100.0,
      );
    }

    Widget showDice() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          showDie(dice1),
          showDie(dice2),
        ],
      );
    }

    Widget rollButton() {
      return RaisedButton(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        color: burntOrange,
        child: Text(
          'Roll',
          style: buttonTextStyle,
        ),
        onPressed: () => updateDiceImages(),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/newbackground@2x.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          diceeLogo(),
          showDice(),
          rollButton(),
        ],
      ),
    );
  }
}
