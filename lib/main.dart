import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

ColorScheme _colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 131, 57, 0),
  brightness: Brightness.dark,
);

class MyApp extends StatelessWidget {
  MyApp({super.key});


  final _theme = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: GoogleFonts.latoTextTheme(),    
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: const Scaffold(
        body: Text('data'),
      ),
    );
  }
}
