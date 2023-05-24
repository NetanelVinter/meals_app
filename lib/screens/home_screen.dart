import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

import 'favorite_meals_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});  

  

  @override
  ConsumerState<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  int currentIndex = 0;  
  String currentTitle = 'Categories';

  void onBottomTap(int index)
  {
    setState(() {
      currentIndex = index;
      currentTitle = currentIndex == 0 ? 'Categories' : 'Favorite Meals';
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> activeFeed = [
      const CategoryScreen(),
      const FavoriteMealsScreen(),    
    ];

    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      body: IndexedStack(
        index: currentIndex,
        children: activeFeed,
      ),      
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        currentIndex: currentIndex,
        onTap: onBottomTap,
      ),
    );
  }
}
