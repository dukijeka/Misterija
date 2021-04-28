import 'package:flutter/material.dart';
import 'package:misterija/screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _darkTheme = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber, disabledColor: Colors.black));

  final _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Misterija',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      home: MainScreen(title: 'Misterija'),
    );
  }
}

