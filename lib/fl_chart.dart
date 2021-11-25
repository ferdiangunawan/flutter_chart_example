import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FLChartLearn extends StatelessWidget {
  const FLChartLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [4, 6, 4, 7, 5, 4, 3, 150, 65, 4, 34, 54, 45];
    return Scaffold(
      appBar: AppBar(
        title: const Text('FL Chart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: LineChart(
              LineChartData(
                  maxY: 110,
                  lineTouchData: LineTouchData(
                      handleBuiltInTouches: true, touchTooltipData: LineTouchTooltipData(tooltipBgColor: Colors.blueGrey.withOpacity(0.8))),
                  // gridData: FlGridData(show: false),
                  borderData: FlBorderData(
                    show: false,
                    border: const Border(
                      bottom: BorderSide(color: Color(0xff4e4965), width: 4),
                      left: BorderSide(color: Colors.transparent),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  titlesData: FlTitlesData(topTitles: SideTitles(showTitles: false), rightTitles: SideTitles(showTitles: false)),
                  lineBarsData: [
                    LineChartBarData(
                        isCurved: true,
                        colors: [const Color(0xff4af699)],
                        barWidth: 8,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: true),
                        spots: List.generate(dataList.length, (index) => FlSpot(index.toDouble(), dataList[index].toDouble())))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
