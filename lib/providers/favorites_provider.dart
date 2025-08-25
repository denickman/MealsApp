import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealapp/models/meal.dart';


/*
  FavoriteMealsNotifier — это контроллер состояния списка любимых блюд.
  Он наследуется от StateNotifier<List<Meal>>, что значит:
  state внутри этого класса это список Meal.
  Любые изменения state автоматически оповещают всех подписчиков (ref.watch) и Flutter перерисует UI.
*/
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {

    final mealsInFavorite = state.contains(meal);

    if (mealsInFavorite) {
      state.where((m) => m.id != meal.id).toList();
    } else {
      // Riverpod требует создавать новый объект списка, а не менять старый через add, 
      // чтобы изменения отслеживались.
      state = [...state, meal]; // [...] берёт все элементы из oldList и помещает их в новый список.
    }
  }
}


/*
StateNotifierProvider — делает этот контроллер доступным в UI через Riverpod.

StateNotifierProvider нужен для:
  - Держать состояние, которое может изменяться со временем (в нашем случае список любимых блюд).
  - Дать доступ к этому состоянию через ref.watch(favoriteMealsProvider) или 
  через ref.read(favoriteMealsProvider.notifier).
  - параметр (FavoriteMealsNotifier) — это класс, который управляет состоянием.
  - параметр (List<Meal>) — это тип состояния, которое хранится в этом классе.
  - Внутри мы создаём инстанс FavoriteMealsNotifier(), который будет хранить наш список.

    ref принадлежит StateNotifierProvider — это объект Riverpod, 
      через который провайдер может взаимодействовать с другими провайдерами или ресурсами.
*/
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
