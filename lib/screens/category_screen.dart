import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('cate', style: TextStyle(color: Colors.white)),
          Text('cate', style: TextStyle(color: Colors.white)),
          Text('cate', style: TextStyle(color: Colors.white)),
          Text('cate', style: TextStyle(color: Colors.white)),
          Text('cate', style: TextStyle(color: Colors.white)),
          Text('cate', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
