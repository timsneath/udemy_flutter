import 'package:flutter/material.dart';
import 'city_page.dart';

class WeatherPage extends StatefulWidget {
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background@2x.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            IconButton(
              alignment: Alignment.topRight,
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.white,
                size: 48.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CityPage()),
                );
              },
            ),
            Text(
              '21°',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Helvetica Neue',
                fontSize: 100.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            Image.asset('assets/sunny.png', fit: BoxFit.contain),
            Text(
              'Loading...',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 33.0,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
