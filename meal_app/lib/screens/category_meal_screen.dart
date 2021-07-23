import 'package:flutter/material.dart';

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

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle!),
        ),
        body: null);
  }
}
