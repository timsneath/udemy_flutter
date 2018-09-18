import 'package:flutter/material.dart';
import 'questions.dart';

const blueColor = Color.fromARGB(255, 49, 130, 217);
const questionTextStyle = TextStyle(
  fontFamily: 'Helvetica Neue',
  fontSize: 25.0,
  fontWeight: FontWeight.w200,
);

void main() => runApp(QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: blueColor,
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
  int currentQuestion = 0;
  int correctlyAnswered = 0;

  resetGame() {
    setState(() {
      currentQuestion = 0;
      correctlyAnswered = 0;
    });
  }

  gameOver() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('All done'),
          content: Text('Your final score was $correctlyAnswered.'),
          actions: [
            FlatButton(
              child: Text('Restart Game'),
              onPressed: () {
                resetGame();
                Navigator.pop(context); // quit dialog
              },
            )
          ],
        );
      },
    );
  }

  answerQuestion(bool answer) {
    if (answer == Questions[currentQuestion].correctAnswer) {
      correctlyAnswered++;
    }

    if (currentQuestion >= Questions.length - 1) {
      gameOver();
    } else {
      setState(() {
        currentQuestion++;
      });
    }
  }

  Widget build(BuildContext context) {
    Widget questionLabel() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
          alignment: Alignment.center,
          child: Text(
            Questions[currentQuestion].text,
            style: questionTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    Widget answerButtons() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('True'),
                color: Colors.green,
                onPressed: () => answerQuestion(true),
              ),
              RaisedButton(
                child: Text('False'),
                color: Colors.red,
                onPressed: () => answerQuestion(false),
              ),
            ],
          ),
        ),
      );
    }

    Widget scoreInformation() {
      return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question: ${currentQuestion + 1} / ${Questions.length}',
            ),
            Text(
              'Score: $correctlyAnswered',
            ),
          ],
        ),
      );
    }

    Widget progressIndicator() {
      return Container(
        alignment: Alignment.bottomCenter,
        child: LinearProgressIndicator(
          value: currentQuestion + 1 / Questions.length,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            questionLabel(),
            answerButtons(),
            scoreInformation(),
            progressIndicator(),
          ],
        ),
      ),
    );
  }
}
