import 'package:flutter/material.dart';
import 'package:mealapp/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mealapp/widgets/main_drawer.dart';
// import 'package:mealapp/screens/tabs.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// ref.watch(...) подписывает твой виджет (FiltersScreen) на изменения состояния в filtersProvider.
// если filtersProvider вернул новое состояние, то автоматически вызывает build у FiltersScreen заново.
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
          children: [
            // GlutenFree Filter
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (newValue) {
               ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, newValue);
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            // Lactose Filter
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, newValue);
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            // Vegetarian Filter
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (newValue) {
               ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, newValue);
              },
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            // Vegan Filter
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (newValue) {
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, newValue);
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}
