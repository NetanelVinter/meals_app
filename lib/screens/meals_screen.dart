import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/drawer_item.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> mealsList = ref.watch(mealsProvider);
    Widget mainWidget;

    if (mealsList.isEmpty) {
      mainWidget = Center(
        child: Column(
          children: [
            Text(
              'Uh oh... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Try selecting diffrent category!',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    else
    {
      mainWidget = ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index) => MealItem(mealsList[index]),        
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Meals'),),      
      body: mainWidget,
    );
  }
}
