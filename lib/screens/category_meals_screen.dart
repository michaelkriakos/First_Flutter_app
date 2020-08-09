import '../models/meal.dart';

import '../widgets/meal_item.dart';

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
//  final String catId;
//  final String catTitle;
  final List<Meal> availabaleMeals;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();

  CategoryMealsScreen(this.availabaleMeals);
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routesArgs['title'];
      final catId = routesArgs['id'];
      displayedMeals = widget.availabaleMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((m) => m.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
