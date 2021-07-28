import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  const FavouritesScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Tou have no favprite meal yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealId: favoriteMeal[index].id,
            imgUrl: favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
    // return Center(
    //   child: Text('favourite'),
    // );
  }
}
