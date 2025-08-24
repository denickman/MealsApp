import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    🔹 Drawer - боковое меню, которое выезжает сбоку экрана (обычно слева).
      Используется внутри Scaffold через свойство drawer:.
      Чаще всего в нём размещают навигацию (переходы между экранами, настройки и т.п.).
      По умолчанию это панель во всю высоту экрана.

    🔹 DrawerHeader - Это специальный виджет-заголовок для Drawer.
      Обычно находится сверху и содержит логотип, иконку, аватар пользователя или приветствие.
      Он автоматически учитывает высоту AppBar, чтобы красиво выровняться.
      В твоём случае там градиент + иконка + текст "Cooking up!".
    */
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(200),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Cooking up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          /*
        🔹 ListTile - Это универсальный элемент списка (строка).
           по сути готовая "ячейка таблицы" или "row-элемент", который экономит время, 
           чтобы не писать Row → Icon + Text + IconButton.
        */
          ListTile( 
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),

            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),

            onTap: () {},
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),

            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
            ),

            onTap: () {},
          ),
        ],
      ),
    );
  }
}
