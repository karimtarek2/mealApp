import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/wedgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen(this.favoriteMeals);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List <Map<String,Object>> pages=[];

  int selectedPageIndex = 0;
void initState(){
  pages = [
  {
  'page': CategoriesScreen(),
  'title': 'Categories',
  },
  {
  'page': FavoritesScreen(widget.favoriteMeals),
  'title': 'Your favorites',
  },
  ];
  super.initState();
}

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),
      ),
      body: pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
