import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(255, 52, 73, 94);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Am Rich',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: Text(
                'I Am Rich',
                style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 40.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: Image.asset('assets/diamond@2x.png',
                  width: 270.0, height: 270.0),
            ),
          ],
        ),
      ),
    );
  }
}
