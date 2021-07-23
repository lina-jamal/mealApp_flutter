import 'package:flutter/material.dart';
import 'package:meal_app/utlis/dummy_data.dart';
import 'package:meal_app/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routArg['id'];
    final catTitle = routArg['title'];
    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              imgUrl: catMeals[index].imageUrl,
              title: catMeals[index].title,
              duration: catMeals[index].duration,
            );
          },
          itemCount: catMeals.length,
        ));
  }
}
