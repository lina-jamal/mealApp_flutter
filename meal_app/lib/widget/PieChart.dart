import 'package:fl_chart/fl_chart.dart';
// import 'package:fl_pie_chart_example/widget/indicators_widget.dart';
// import 'package:fl_pie_chart_example/widget/pie_chart_sections.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widget/getSections.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State {
  // int touchedIndex = 0;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: [
            Expanded(
              child: PieChart(
                PieChartData(
                  // pieTouchData: PieTouchData(
                  //   touchCallback: (pieTouchResponse) {
                  //     setState(() {
                  //       if (pieTouchResponse.touchInput is FlLongPressEnd ||
                  //           pieTouchResponse.touchInput is FlPanEnd) {
                  //         touchedIndex = -1;
                  //       } else {
                  //         touchedIndex = pieTouchResponse.touchedSectionIndex;
                  //       }
                  //     });
                  //   },
                  // ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: getSections(),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(16),
            //       child: IndicatorsWidget(),
            //     ),
            //   ],
            // ),
          ],
        ),
      );
}
