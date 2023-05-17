import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/constant/routes.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

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
      initialRoute: homeScreenRoute,
      routes: {
        homeScreenRoute: (context) => const HomeScreen(),
        mealsScreenRoute: (context) => const MealsScreen(),
        categorysScreenRoute: (context) => const CategoryScreen(),
      },
    );
  }
}
