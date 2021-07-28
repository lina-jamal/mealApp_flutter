import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'categoryMeals';
  final List<Meal> _avaiaibleMeal;

  const CategoryMealScreen(this._avaiaibleMeal);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String catTitle;
  late List<Meal> catMeals;
  @override
  void didChangeDependencies() {
    final routArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catId = routArg['id'];
    catTitle = "${routArg['title']}";
    catMeals = widget._avaiaibleMeal.where((meal) {
      return meal.categories.contains(catId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      catMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              mealId: catMeals[index].id,
              imgUrl: catMeals[index].imageUrl,
              title: catMeals[index].title,
              duration: catMeals[index].duration,
              complexity: catMeals[index].complexity,
              affordability: catMeals[index].affordability,
            );
          },
          itemCount: catMeals.length,
        ));
  }
}
