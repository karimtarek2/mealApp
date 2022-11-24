import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function() tapHandler){
return ListTile(
  leading: Icon(
    icon,
    size: 26,
  ),
  title: Text(
    title,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "RobotoCondensed",
    ),
  ),
  onTap: tapHandler,
);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.pink),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal",Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile("Filters",Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);}),
        ],
      ),
    );
  }
}
