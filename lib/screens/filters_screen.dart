import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/constant/filters.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);

    Map<String, bool> filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: ListView.builder(
        itemCount: filters.length,
        itemBuilder: (context, index) {
          String currentFilter = filtersTile[index].entries.first.key;

          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: SwitchListTile(
              value: filters[currentFilter]!,
              onChanged: (isCheck) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(currentFilter, isCheck);
              },
              title: Text(
                currentFilter,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: theme.colorScheme.onBackground),
              ),
              subtitle: Text(
                filtersTile[index][currentFilter]!,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: theme.colorScheme.onBackground),
              ),
            ),
          );
        },
      ),
    );
  }
}
