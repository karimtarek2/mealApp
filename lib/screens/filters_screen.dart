import 'package:flutter/material.dart';
import 'package:meal_app/wedgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.currentFilters,this.saveFilters);

  static const routName = '/filters';

  final Function saveFilters;
final Map<String , bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  initState (){
     glutenFree = widget.currentFilters['gluten']!;
     lactoseFree = widget.currentFilters['lactose']!;
     vegan = widget.currentFilters['vegan']!;
     vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget BuildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
        title: Text('Your Filter'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BuildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
