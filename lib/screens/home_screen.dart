import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constant/routes.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

import '../widgets/drawer_item.dart';

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
      MealsScreen(ref.watch(favoriteMealsProvider), showAppBar: false,),    
    ];

    return Scaffold(
      appBar: AppBar(title: Text(currentTitle)),
      body: IndexedStack(
        index: currentIndex,
        children: activeFeed,
      ),
      drawer: const DrawerItem(),
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
