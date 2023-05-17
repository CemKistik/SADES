import 'package:flutter/material.dart';

class Themes{
  final lightTheme=ThemeData.light().copyWith(primaryColor: Colors.blueGrey[300]);
  final darkTheme=ThemeData.dark().copyWith(
    primaryColor: Color.fromARGB(255, 9, 9, 9),
    );
}