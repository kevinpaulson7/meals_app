import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme:const ColorScheme.light(
      primary:
          Color.fromARGB(255, 45, 22, 215), // Your preferred primary color
      secondary: Colors.orange, // Your secondary color
      background: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.black,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    colorScheme:const ColorScheme.dark(
      primary: Color.fromARGB(255, 105, 87, 241),
      secondary: Color.fromARGB(255, 255, 157, 0),
      background: Colors.black,
      surface: Color.fromARGB(255, 57, 55, 55),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Color.fromARGB(255, 255, 255, 255),
      onSurface: Colors.white,
      error: Colors.redAccent,
      onError: Colors.black,
    ),
  );
}
