


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

import '../models/meal.dart';


class MealsProvider extends StateNotifier<List<Meal>>
{
  MealsProvider() :  super(dummyMeals);

  List<Meal> get meals 
  {
    return state;
  }
  
}

final mealsProvider = StateNotifierProvider<MealsProvider , List<Meal>>((ref) => MealsProvider());