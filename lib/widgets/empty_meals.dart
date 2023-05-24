import 'package:flutter/material.dart';

class EmptyMeals extends StatelessWidget {
  const EmptyMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
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
  }
}