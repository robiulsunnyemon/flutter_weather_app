import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff1e3799),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff1e3799),
    foregroundColor: Colors.white
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
