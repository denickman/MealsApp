import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';

class CategoryGridItem extends StatelessWidget {

  const CategoryGridItem({super.key, required this.category, });

  final Category category;

  @override
  Widget build(BuildContext context) {
   return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        category.color.withAlpha(130),
        category.color.withAlpha(200),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight
      )
    ),
    child: Text(
      category.title, 
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      )
      )
   );
  }
}