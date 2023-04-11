import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'models/settings.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routes.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
                headline1: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetails: (ctx) => MealDetailScreen(
              isFavorite: _isFavorite,
              onToggleFavorite: _toggleFavorite,
            ),
        AppRoutes.settings: (context) => SettingsScreen(_filterMeals, settings),
      },
    );
  }
}
