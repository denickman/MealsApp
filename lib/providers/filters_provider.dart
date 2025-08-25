import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/providers/meals_provider.dart';

// if multiple providers are closely related to each other it make sense to put them into the same file


// StateProvider - Самый простой провайдер состояния.
// Держит внутри одно значение (например int, bool, String, enum, List и т.д.).
// Ты можешь менять его напрямую через .state.

// StateNotifierProvider - Использует класс-наследник StateNotifier<T>.
// Хранит состояние типа T, но обновляется только через методы, которые ты сам определяешь.
// Удобно, когда нужно инкапсулировать бизнес-логику: валидацию, фильтрацию, вызовы API, 
// сложные изменения состояния.


enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; - not allowed, => mutating state
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );


// Provider
// → Используется, когда сам провайдер не управляет состоянием, а лишь вычисляет/комбинирует данные 
// из других провайдеров.
// Он реагирует на изменения в зависимостях (ref.watch) и отдаёт новое значение.
// Но у него нет методов setState, setFilter, и он ничего сам не меняет.

final filteredMealsProvider = Provider((ref) {

  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
      // Если фильтр включён, но блюдо не соответствует этому фильтру — выкидываем его
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});


