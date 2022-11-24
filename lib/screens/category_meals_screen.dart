import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../models/meal.dart';
import '../wedgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
   CategoryMealsScreen(this.availableMeals);

  static const routeName = 'category_meals';

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayMeals;

  @override
  void didChangeDependencies() {
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals![index].id,
            imageUrl: displayMeals![index].imageUrl,
            title: displayMeals![index].title,
            duration: displayMeals![index].duration,
            complexity: displayMeals![index].complexity,
            affordability: displayMeals![index].affordability,
          );
        },
        itemCount: displayMeals!.length,
      ),
    );
  }
}
