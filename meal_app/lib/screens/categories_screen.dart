import 'package:flutter/material.dart';
import 'package:meal_app/widget/category_item.dart';
import '../utlis/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal')),
      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) =>
                  CategortItem(catData.id, catData.title, catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
