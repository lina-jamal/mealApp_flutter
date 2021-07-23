import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imgUrl;

  const MealItem(this.imgUrl);
  void selectedMeal() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imgUrl),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
