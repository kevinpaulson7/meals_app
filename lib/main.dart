import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'theme.dart'; // 👈 Import the custom theme file

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: lightTheme(), // 👈 Apply the light theme
      darkTheme: darkTheme(), // 👈 Apply the dark theme
      themeMode: ThemeMode.system, // 👈 Auto-switch between light/dark mode
      home: const TabsScreen(),
    );
  }
}
