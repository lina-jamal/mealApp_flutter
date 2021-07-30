import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:meal_app/utlis/dummy_data.dart';
import 'indicator.dart';

class PieChartPage extends StatefulWidget {
  List dataList;
  PieChartPage({required this.dataList});

  @override
  State<StatefulWidget> createState() => PieChartPageState();
}

class PieChartPageState extends State<PieChartPage> {
  var nutric = DUMMY_MEALS[0].nutric;

  @override
  Widget build(BuildContext context) {
    print(widget.dataList);
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.yellow[50],
        child: Row(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.dataList
                  .map(
                    (e) => Indicator(
                      color: e['color'],
                      text: e['name'],
                      isSquare: true,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return widget.dataList
        .map((e) => PieChartSectionData(
              color: e['color'],
              value: e['precent'].toDouble(),
              title: '${e['precent']}%',
              titleStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            ))
        .toList();
  }
}
