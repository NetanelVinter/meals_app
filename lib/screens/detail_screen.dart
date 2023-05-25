import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen(this.meal, {super.key});

  final Meal meal;

  void addFavoriteMeal(WidgetRef ref, List<Meal> meals) {
    meals.contains(meal) == false
        ? ref.read(favoriteMealsProvider.notifier).addToFavoriteMeals(meal)
        : ref
            .read(favoriteMealsProvider.notifier)
            .removeFromFavoriteMeals(meal);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
    Icon currentIcon = favoriteMeals.contains(meal) == true
        ? const Icon(
            Icons.star,
            key: ValueKey(1),
          )
        : const Icon(
            Icons.star_border,
            key: ValueKey(0),
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () => addFavoriteMeal(ref, favoriteMeals),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: currentIcon,
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                child: child,
              ),
            ),
          )
        ],
      ),
      body: Column(children: [
        Hero(
          tag: meal.id,
          child: FadeInImage(
            image: NetworkImage(meal.imageUrl),
            placeholder: MemoryImage(kTransparentImage),
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Ingridiant',
          style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        for (String ingr in meal.ingredients)
          Text(
            ingr,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        const SizedBox(height: 10),
        Text(
          'Steps',
          style: theme.textTheme.headlineLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w800),
        ),
        Expanded(
          child: Container(
            height: 200,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 0.5),
                color: theme.colorScheme.secondaryContainer),
            child: ListView(shrinkWrap: true, children: [
              for (String step in meal.steps)
                Text(
                  step,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onSecondaryContainer),
                  textAlign: TextAlign.center,
                ),
            ]),
          ),
        )
      ]),
    );
  }
}
