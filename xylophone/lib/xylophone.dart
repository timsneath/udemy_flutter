import 'package:flutter/material.dart';

class XylophoneBar {
  final String name;
  final Color barColor;

  const XylophoneBar(this.name, this.barColor);
}

const xylophoneBars = [
  XylophoneBar("note1", Color.fromARGB(255, 231, 76, 60)),
  XylophoneBar("note2", Color.fromARGB(255, 230, 126, 34)),
  XylophoneBar("note3", Color.fromARGB(255, 241, 196, 15)),
  XylophoneBar("note4", Color.fromARGB(255, 46, 204, 113)),
  XylophoneBar("note5", Color.fromARGB(255, 26, 188, 156)),
  XylophoneBar("note6", Color.fromARGB(255, 52, 152, 219)),
  XylophoneBar("note7", Color.fromARGB(255, 155, 89, 182)),
];
