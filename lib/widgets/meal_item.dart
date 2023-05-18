import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Stack(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Positioned(                      
            bottom: 0,
            left: 0,
            right: 0,                
            child: Container(         
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 6),     
              //color: Colors.black54,
              color: Theme.of(context).colorScheme.background.withOpacity(0.5),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,                    
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(width: 12),
                      MealItemTrait(icon: Icons.work, label: meal.complexity.name),
                      const SizedBox(width: 12),
                      MealItemTrait(icon: Icons.attach_money, label: meal.affordability.name),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
