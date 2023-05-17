import 'package:flutter/material.dart';
import 'package:meals_app/constant/routes.dart';

import '../widgets/drawer_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MealsApp')),      
      drawer: const DrawerItem(),
    );
  }
}

