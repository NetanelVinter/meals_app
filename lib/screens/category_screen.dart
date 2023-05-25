import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  final List<Category> categoryList = availableCategories;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
        ),
        children: [for (Category cate in categoryList) CategoryItem(cate)],
      ),
      builder: (context, children) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Curves.linear,
        )),
        child: children,
      ),
    );
  }
}
