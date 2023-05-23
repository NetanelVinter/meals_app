import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(children: [
        FadeInImage(

          image: NetworkImage(meal.imageUrl),
          placeholder: MemoryImage(kTransparentImage),
          fit: BoxFit.cover,
          height: 250,
          width: double.infinity,
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
