import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary:
          Color.fromARGB(255, 105, 87, 241), // Your preferred primary color
      secondary: Colors.orange, // Your secondary color
      background: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 255, 255, 255)!,
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
    colorScheme: ColorScheme.dark(
      primary: Color.fromARGB(255, 105, 87, 241),
      secondary: Colors.teal,
      background: Colors.black,
      surface: Colors.grey[800]!,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
      error: Colors.redAccent,
      onError: Colors.black,
    ),
  );
}
