import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/screens/tabs.dart';
import 'theme.dart'; // 👈 Import the custom theme file

void main() {
  runApp(const ProviderScope(
    child: App(),
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: lightTheme(), 
      darkTheme: darkTheme(), 
      themeMode: ThemeMode.system,
      home: const TabsScreen(),
    );
  }
}
