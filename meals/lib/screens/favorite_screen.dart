import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma comida favoritada.'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
