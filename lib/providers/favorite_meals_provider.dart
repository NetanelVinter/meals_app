
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider(): super([]);
  
  void addToFavoriteMeals(Meal meal)
  {
    state = [...state, meal];
  }

  void removeFromFavoriteMeals(Meal meal)
  {
    List<Meal> temp = List.of(state);
    temp.remove(meal);
    state = temp;
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsProvider, List<Meal>>((ref) {
  return FavoriteMealsProvider();
});