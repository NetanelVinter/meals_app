


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

import '../models/meal.dart';


class CategoryMealsProvider extends StateNotifier<List<Meal>>
{
  CategoryMealsProvider() :  super([]);

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

final categoryMealsProvider = StateNotifierProvider<CategoryMealsProvider , List<Meal>>((ref) => CategoryMealsProvider());