import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late final List<Map<String, Object>> _screens;

  void initState() {
    super.initState();
    _screens = [
      {
        "title": "Lista de Categorias",
        "screen": CategoriesScreen(),
      },
      {
        "title": "Favoritos",
        "screen": FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"] as String),
      ),
      body: _screens[_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categorias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Favoritos',
            ),
          ]),
      drawer: MainDrawer(),
    );
  }
}
