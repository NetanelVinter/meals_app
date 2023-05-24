import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constant/filters.dart';
import '../models/meal.dart';

class FiltersProvider extends StateNotifier<Map<String, bool>> {
  FiltersProvider(): super({kGlutenFree: false, kLactoseFree: false, kVegetarian: false, kVegan: false});

  void setFilter(String filter, bool isActive)
  {
    var temp = Map.of(state);
    temp[filter] = isActive;
    state = temp;
  }

  void getFilterMeals(List<Meal> meals)
  {
    List<Meal> temp = [];
    
    for (var meal in meals) {
      if (!meal.isGlutenFree && state[kGlutenFree] == true ||
          !meal.isLactoseFree && state[kLactoseFree] == true ||
          !meal.isVegetarian && state[kVegetarian] == true ||
          !meal.isVegan && state[kVegan] == true)
      {
        temp.add(meal);
      }      
    }    

    for (var meal in temp) {
      meals.remove(meal);
    }    
  }
}

final filtersProvider = StateNotifierProvider<FiltersProvider, Map<String, bool>>((ref) {
  return FiltersProvider();
});