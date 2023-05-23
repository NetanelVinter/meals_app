import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/drawer_item.dart';

import '../models/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  final List<Category> categoryList = availableCategories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(       
      drawer: const DrawerItem(),      
      body: GridView(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
        ),
        children: [
          for(Category cate in categoryList)
            CategoryItem(cate)          
        ],
      ),
    );
  }
}
