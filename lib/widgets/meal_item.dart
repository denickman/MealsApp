import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mealapp/widgets/meal_item_trait.dart';
import 'package:mealapp/widgets/meal_item.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // по умолчанию Stack игнорирует RoundedRectangleBorder
      // shape: RoundedRectangleBorder → определяет форму для рисования рамки/фона.
      // clipBehavior → управляет, будет ли контент внутри подчиняться этой форме.
      clipBehavior: Clip.hardEdge,
      // elevation - свойство у Card или Material.
      // Отвечает за тень под карточкой, создаёт эффект «поднятости» над поверхностью.
      // Значение — это глубина тени (чем выше — тем сильнее и ярче тень).
      elevation: 2,

      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            /*
            FadeInImage - Это виджет во Flutter, который сначала показывает placeholder (заглушку), 
            а потом плавно (fade-анимацией) подгружает основное изображение.

            🔹 MemoryImage
            Это виджет-загрузчик картинки, который берёт данные прямо из памяти (массив байтов).
            В твоём случае используется, чтобы показать заглушку (placeholder).

            🔹 kTransparentImage
            Эта константа приходит из пакета transparent_image.
            Она содержит 1x1 пиксель прозрачного PNG (в бинарном виде).
            То есть вместо того, чтобы хранить где-то свой файл "пустая картинка", 
            ты можешь просто подключить этот пакет и использовать его как "идеально прозрачную заглушку".

            BoxFit.cover - настройка для картинки (Image, FadeInImage, NetworkImage) или 
            любого BoxDecoration с изображением. Определяет, как изображение вписывается в контейнер.
            Изображение будет масштабироваться, чтобы полностью заполнить контейнер.
            */
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double
                  .infinity, // use as much space as it can get horizontally
            ),
            // Positioned — это виджет для Stack, который позволяет точно разместить элемент
            // внутри стека по координатам. Работает только внутри Stack.
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      // TextOverflow.ellipsis - Это настройка текста.
                      // Если строка слишком длинная и не помещается, Flutter по умолчанию её обрезает.
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: "${meal.duration} min",
                        ),

                        const SizedBox(width: 12),

                        MealItemTrait(
                          icon: Icons.schedule,
                          label: complexityText,
                        ),

                        const SizedBox(width: 12),

                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
