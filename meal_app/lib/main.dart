import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'utlis/dummy_data.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/category_meal_screen.dart';
import 'screens/meal_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  void changeNumber() {
    print('Testing');
  }

  final List<Meal> favoriteMeal = [];

  bool isMealFavourite(String id) {
    return favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _avaiaibleMeal = DUMMY_MEALS;
  _setFilter(Map<String, bool> _filterType) {
    print(_filterType);
    setState(() {
      _filters = _filterType;

      _avaiaibleMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existIndex =
        widget.favoriteMeal.indexWhere((meal) => meal.id == mealId);
    print(existIndex);
    if (existIndex >= 0) {
      setState(() {
        _avaiaibleMeal.removeAt(existIndex);
      });
    } else {
      setState(() {
        widget.favoriteMeal
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      // home: MyHomePage(),
      routes: {
        '/': (context) => TabsScreen(widget.favoriteMeal),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_avaiaibleMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, widget.isMealFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilter),
      },
    );
  }
}
