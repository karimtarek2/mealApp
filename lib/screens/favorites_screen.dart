import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../wedgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('Favorites'),
      );
    }
else{
  return ListView.builder(
    itemBuilder: (ctx, index) {
      return MealItem(
        id: favoriteMeals[index].id,
        imageUrl: favoriteMeals[index].imageUrl,
        title: favoriteMeals[index].title,
        duration: favoriteMeals[index].duration,
        complexity: favoriteMeals[index].complexity,
        affordability: favoriteMeals[index].affordability,
      );
    },
    itemCount: favoriteMeals.length,
  );
    }

  }
}
