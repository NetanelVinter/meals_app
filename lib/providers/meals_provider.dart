


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

import '../models/meal.dart';


class MealsProvider extends StateNotifier<List<Meal>>
{
  MealsProvider() :  super([]);

  void setStateByCategory(Category cate) 
  {
    List<Meal> temp = [];

    for (Meal meal in dummyMeals) {
      if(meal.categories.contains(cate.id))
      {
        temp.add(meal);
      }
    }

    state = temp;
  }   
}

final mealsProvider = StateNotifierProvider<MealsProvider , List<Meal>>((ref) => MealsProvider());