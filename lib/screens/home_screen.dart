import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/widgets/drawer_item.dart';

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

  final List<Widget> activeFeed = [
      const CategoryScreen(),
      const FavoriteMealsScreen(),    
    ];

  void onBottomTap(int index)
  {
    setState(() {
      currentIndex = index;
      currentTitle = currentIndex == 0 ? 'Categories' : 'Favorite Meals';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      drawer: const DrawerItem(),
      body: activeFeed[currentIndex],      
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
