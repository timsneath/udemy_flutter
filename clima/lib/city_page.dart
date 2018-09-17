import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    Widget backButton() {
      return IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    Widget cityTextBox() {
      return TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          border: OutlineInputBorder(),
          hintText: 'Enter City Name',
        ),
      );
    }

    Widget weatherButton() {
      return FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Get Weather',
          style: textTheme.display1.copyWith(color: Colors.white),
        ),
      );
    }

    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cityBackground@2x.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0),
                child: Column(
                  children: [
                    cityTextBox(),
                    weatherButton(),
                  ],
                ),
              ),
              Positioned(
                top: 28.0,
                left: 16.0,
                child: backButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
