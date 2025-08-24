import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/screens/meals.dart';
import 'package:mealapp/widgets/category_grid_item.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite
    });

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    //Navigator.push(context, route);
    /*
    MaterialPageRoute — это реализация маршрута (Route), которая:
    Поддерживает анимацию перехода в стиле Material Design (например, слайд слева направо на Android).
    Оборачивает новый экран (builder) в правильный контекст Material (например, для темизации).
    Управляет жизненным циклом экрана (инициализация/дестрой).
    MaterialPageRoute отвечает за то, чтобы переход был «материальный» (с анимацией и правильной темой).

    Альтернативы
      - Можно было бы использовать PageRouteBuilder, если хочешь кастомную анимацию.
      - Или вместо MaterialPageRoute использовать CupertinoPageRoute — 
      и тогда на iOS будет анимация в стиле iOS (свайп назад и т.д.).
      - Для более сложных навигаций часто используют GoRouter или auto_route.
    */

    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(
              title: category.title, 
              meals: filteredMeals,
              onToggleFavorite: onToggleFavorite,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList();
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      );
  }
}
