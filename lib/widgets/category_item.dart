import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constant/routes.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(mealsProvider.notifier).setStateByCategory(category);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MealsScreen(ref.read(mealsProvider))));
      },
      splashColor: Theme.of(context).primaryColorLight.withOpacity(0.7),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(   
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
