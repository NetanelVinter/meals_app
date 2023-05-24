import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/empty_meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';
import '../providers/meals_provider.dart';

class CategoryMealsScreen extends ConsumerWidget {
  const CategoryMealsScreen({super.key});  
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> categoryMeals = ref.watch(mealsProvider);
    
    Widget mainWidget = categoryMeals.isEmpty
        ? const EmptyMeals()
        : ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return MealItem(categoryMeals[index]);
            },
          );

    return Scaffold(
      appBar: AppBar(title: const Text('Meals Category'),),
      body: mainWidget,
    );
  }
}
