import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constant/routes.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 131, 57, 0),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      initialRoute: loginScreenRoute,
      routes: {
        loginScreenRoute:(context) => const LoginScreen1(),
        homeScreenRoute: (context) => const HomeScreen(),      
        filtersScreenRoute:(context) => const FilterScreen(),             
      },
    );
  }
}
