import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen(this.mealList, {super.key, this.showAppBar = true,});

  final bool? showAppBar;
  final List<Meal> mealList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    Widget mainWidget;

    if (mealList.isEmpty) {
      mainWidget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
    } else {
      mainWidget = ListView.builder(
        itemCount: mealList.length,
        itemBuilder: (context, index) => MealItem(mealList[index]),
      );
    }


    if (showAppBar == false){
      return mainWidget;
    }

    return Scaffold(  
      appBar: AppBar(title: const Text('Meals'),),
      body: mainWidget,
    );
  }
}
