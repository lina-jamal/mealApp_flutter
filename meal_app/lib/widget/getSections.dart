import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/utlis/dummy_data.dart';

final nutric = DUMMY_MEALS[0].nutric;

getSections() => nutric
    .asMap()
    .map<int, PieChartSectionData>((i, e) {
      final va = PieChartSectionData(
        color: const Color(0xff0293ee),
        value: e['precent'],
        title: '${e['percent']}%',
        titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      );
      return MapEntry(i, va);
    })
    .values
    .toList();

//  PieData.data
//     .asMap()
//     .map<int, PieChartSectionData>((index, data) {
//       // final isTouched = index == touchedIndex;
//       // final double fontSize = isTouched ? 25 : 16;
//       // final double radius = isTouched ? 100 : 80;
//       print(PieData.data);
//       final value = PieChartSectionData(
//         color: data.color,
//         value: data.percent,
//         title: '${data.percent}%',
//         // radius: radius,
//         titleStyle: TextStyle(
//           // fontSize: fontSize,
//           fontWeight: FontWeight.bold,
//           color: const Color(0xffffffff),
//         ),
//       );

//       return MapEntry(index, value);
//     })
//     .values
//     .toList();
