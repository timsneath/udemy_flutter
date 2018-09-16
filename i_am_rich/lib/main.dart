import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(255, 52, 73, 94);

void main() => runApp(RichApp());

class RichApp extends StatelessWidget {
  Widget homePage() {
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

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      color: backgroundColor,
      title: 'I Am Rich',
      home: homePage(),
    );
  }
}
