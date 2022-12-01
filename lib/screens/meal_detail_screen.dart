import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  static const routeName = 'meal_detail';
  final void Function(String) toggleFavorite;
  final bool Function(String) isFavorite;

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 500,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    List listOfIngredients = selectedMeal.ingredients;
    List listOfSteps = selectedMeal.steps;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),

            Column(
              children: [
                ...listOfIngredients.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e),
                      ),
                    ),
                  );
                })
              ],
            ),

            // Container(
            //   width: double.infinity,
            //   child: buildContainer(
            //     ListView.builder(
            //       itemBuilder: (ctx, index) => Card(
            //         color: Colors.amber,
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //               vertical: 5, horizontal: 10),
            //           child: Text(selectedMeal.ingredients[index]),
            //         ),
            //       ),
            //       itemCount: selectedMeal.ingredients.length,
            //     ),
            //   ),
            // ),
            buildSectionTitle(context, 'Steps'),
            Column(
              children: [
                ...listOfSteps.map((z) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                       backgroundColor: Colors.pink,
                                       child: Text('#'),
                                     ),
                                     title: Text(
                                       z,
                                       style: TextStyle(fontSize: 15),
                                     ),
                                   ),
                                   Divider(),
                                 ],
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
            // Container(
            //   width: double.infinity,
            //   child: buildContainer(ListView.builder(
            //     itemBuilder: (ctx, index) => Column(
            //       children: [
            //         ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.pink,
            //             child: Text('# ${index + 1}'),
            //           ),
            //           title: Text(
            //             selectedMeal.steps[index],
            //             style: TextStyle(fontSize: 15),
            //           ),
            //         ),
            //         Divider(),
            //       ],
            //     ),
            //     itemCount: selectedMeal.steps.length,
            //   )),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Widget? cards(List<dynamic> listOfIngredients) {
    for (int i = 0; i < listOfIngredients.length; i++) {
      return Card(
        child: Text(listOfIngredients[i].toString()),
      );
    }
  }
}
