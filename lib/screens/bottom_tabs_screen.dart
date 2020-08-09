import '../models/meal.dart';

import '../models/Tab.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class BottomTabsScreen extends StatefulWidget {
  List<Meal> favoriteMeals;

  BottomTabsScreen(this.favoriteMeals);

  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Widget> _pages;
  final List<String> _titles = ['Categories', 'Your Favorite'];

  @override
  void initState() {
    _pages = [CategoryScreen(), FavoritesScreen(widget.favoriteMeals)];
    super.initState();
  } //  List<TabItem> _pages = [
//    new TabItem(page: CategoryScreen(), title: 'Categories'),
//    new TabItem(page: FavoritesScreen(), title: 'Your Favorite'),
//  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedPageIndex])),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );
  }
}
