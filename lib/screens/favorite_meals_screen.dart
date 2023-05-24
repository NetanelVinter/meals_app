import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:meals_app/widgets/empty_meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class FavoriteMealsScreen extends ConsumerWidget {
  const FavoriteMealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
    
    Widget mainWidget = favoriteMeals.isEmpty
        ? const EmptyMeals()
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(favoriteMeals[index]);
            },
          );
    return Scaffold(
      body: mainWidget,
    );
  }
}
