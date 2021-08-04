import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ComboChartPage extends StatefulWidget {
  ComboChartPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ComboChartPageState createState() => _ComboChartPageState();
}

class _ComboChartPageState extends State<ComboChartPage> {
  late List<SalesData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Container(
                width: _chartData.length * 200,
                child: SfCartesianChart(
                    legend: Legend(isVisible: true),
                    primaryXAxis:
                    CategoryAxis(title: AxisTitle(text: 'Primary X Axis')),
                    primaryYAxis: NumericAxis(
                        title: AxisTitle(
                            text: 'Primary Y Axis (Sales in USD Millions)')),
                    axes: <ChartAxis>[
                      CategoryAxis(
                          name: 'xAxis',
                          title: AxisTitle(text: 'Secondary X Axis'),
                          opposedPosition: true),
                      NumericAxis(
                          name: 'yAxis',
                          opposedPosition: true,
                          interval: 5)
                    ],
                    series: <CartesianSeries>[
                      ColumnSeries<SalesData, String>(
                          name: 'Sales',
                          dataSource: _chartData,
                          xValueMapper: (SalesData sales, _) => sales.salesMonth,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                      LineSeries<SalesData, String>(
                          markerSettings: MarkerSettings(
                            isVisible: true,
                          ),
                          name: 'Profit',
                          dataSource: _chartData,
                          xValueMapper: (SalesData sales, _) => sales.salesMonth,
                          yValueMapper: (SalesData sales, _) => sales.profit,
                          xAxisName: 'xAxis',
                          yAxisName: 'yAxis'),
                    ]),
              ),
            )));
  }

  List<SalesData> getChartData() {
    return <SalesData>[
      SalesData('Jan', 35, 15),
      SalesData('Feb', 79, 80),
      SalesData('Mar', 88, 20),
      SalesData('Apr', 10, 34),
      SalesData('May', 92, 18),
      SalesData('Jun', 28, 42),
      SalesData('Jul', 38, 61),
      SalesData('Aug', 18, 25),
      SalesData('Sep', 23, 82),
      SalesData('Oct', 35, 21),
      SalesData('Nov', 68, 40),
      SalesData('Dec', 88, 68),
    ];
  }
}

class SalesData {
  SalesData(this.salesMonth, this.sales, this.profit);

  final String salesMonth;
  final double sales;
  final double profit;
}
