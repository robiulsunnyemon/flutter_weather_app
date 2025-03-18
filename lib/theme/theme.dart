import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.blueAccent[100],
  appBarTheme: AppBarTheme(
    color: Colors.white10
  ),
  colorScheme:
      ColorScheme.light(
        brightness: Brightness.light,

      ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  colorScheme:
      ColorScheme.dark(
        brightness: Brightness.light,
      ),
);
