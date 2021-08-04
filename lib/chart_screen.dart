import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  ChartPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late List<SalesData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = getChartData();

    return SafeArea(
        child: Scaffold(
            body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: SfCartesianChart(
                        title: ChartTitle(
                          text: 'Sales Report Data'
                        ),
                          primaryXAxis: DateTimeAxis(),
                          primaryYAxis: NumericAxis(
                            visibleMaximum: 100
                          ),
                          series: <ChartSeries>[
                          // Renders line chart
                          LineSeries<SalesData, DateTime > (
                          xAxisName: "Date",
                          yAxisName: "Profit",
                          markerSettings: MarkerSettings(
                          isVisible: true,
                      ),
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                      ])),
                ))));
  }

  List<SalesData> getChartData() {
    return <SalesData>[
      SalesData(DateTime.utc(2021, 1, 9), 35),
      SalesData(DateTime.utc(2021, 2, 10), 58),
      SalesData(DateTime.utc(2021, 3, 28), 34),
      SalesData(DateTime.utc(2021, 4, 19), 98),
      SalesData(DateTime.utc(2021, 5, 26), 76),
      SalesData(DateTime.utc(2021, 6, 16), 46),
      SalesData(DateTime.utc(2021, 7, 12), 30),
    ];
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final DateTime year;
  final double sales;
}
