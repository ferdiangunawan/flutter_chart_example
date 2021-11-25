import 'package:flutter/material.dart';
import 'package:learn_chart/fl_chart.dart';
import 'package:learn_chart/line_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = [10, 45, 63, 12, 66, 100];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Chart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SfCartesianChart(
              primaryYAxis: NumericAxis(plotBands: [
                PlotBand(
                    // verticalTextPadding: '5%',
                    // horizontalTextPadding: '5%',
                    text: 'Average',
                    textAngle: 0,
                    start: 110,
                    end: 110,
                    textStyle: const TextStyle(color: Colors.deepOrange, fontSize: 16),
                    borderColor: Colors.red,
                    borderWidth: 2)
              ]),
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<SalesNumber, num>>[
                LineSeries<SalesNumber, num>(
                    xAxisName: 'Time',
                    yAxisName: 'Temperature',
                    dataSource: <SalesNumber>[
                      SalesNumber(coolTemp: 1, yValue: 2),
                      SalesNumber(coolTemp: 2, yValue: 43),
                      SalesNumber(coolTemp: 3, yValue: 34),
                      SalesNumber(coolTemp: 4, yValue: 90),
                      SalesNumber(coolTemp: 5, yValue: 54),
                    ],
                    xValueMapper: (SalesNumber sales, _) => sales.coolTemp,
                    yValueMapper: (SalesNumber sales, _) => sales.yValue,
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class SalesNumber {
  final num coolTemp;
  final num yValue;
  SalesNumber({
    required this.coolTemp,
    required this.yValue,
  });
}
