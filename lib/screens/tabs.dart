import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/meals.dart';

const kInitialFilters = {
  Filter.gluten: false,
  Filter.lactose: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Just removed from favorites..');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Added to favorites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilter: _selectedFilters,)),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.gluten]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactose]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: TabBarView(
      physics: const BouncingScrollPhysics(), // Enables smooth swiping
      children: [
        CategoriesScreen(
          onToggleFavorite: _toggleMealFavoriteStatus,
          availableMeals: availableMeals,
        ),
        MealsScreen(
          meals: _favoriteMeals,
          onToggleFavorite: _toggleMealFavoriteStatus,
        ),
      ],
      controller: TabController(
        length: 2,
        vsync: Navigator.of(context),
        initialIndex: _selectedPageIndex,
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _selectedPageIndex = index;
        });
        DefaultTabController.of(context)?.animateTo(index);
      },
      currentIndex: _selectedPageIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.set_meal),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favorites',
        ),
      ],
    ),
  ),
);

  }
}
