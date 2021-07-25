import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  Widget buildSwitchListTile(
      String title, String subTitle, bool currentVal, onChangeValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentVal,
      subtitle: Text(subTitle),
      onChanged: onChangeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filter'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten Free',
                'Only include glutenfree meals',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose Free',
                'Only include lactoseFree meals',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                '_Vegetarian',
                'Only include vegetarian meals',
                _glutenFree,
                (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _glutenFree,
                (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
