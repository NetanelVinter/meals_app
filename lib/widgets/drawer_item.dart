import 'package:flutter/material.dart';

import '../constant/routes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Drawer(      
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: ListTile(
            title: Text(
              'Cooking Up!',
              style: theme.textTheme.headlineMedium!
                  .copyWith(color: theme.colorScheme.onPrimaryContainer),
            ),
            leading: Icon(
              Icons.fastfood,
              size: 48,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        ListTile(
          title: Text('Meals',
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onBackground)),
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: theme.colorScheme.onBackground,
          ),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(                    
          title: Text('Filters',
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onBackground)),
          leading: Icon(
            Icons.settings,
            size: 26,
            color: theme.colorScheme.onBackground,
          ),
          onTap: () => Navigator.pushNamed(context, filtersScreenRoute),          
        ),
      ],
    ));
  }
}
