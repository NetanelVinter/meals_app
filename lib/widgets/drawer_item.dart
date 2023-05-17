import 'package:flutter/material.dart';

import '../constant/routes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, mealsScreenRoute),
                child: const Text('Meals'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, categorysScreenRoute),
                child: const Text('Category'),
              )
            ],
          ),
        ));
  }
}
