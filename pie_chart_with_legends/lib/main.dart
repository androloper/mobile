import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('R', 33),
      ChartData('B', 30),
      ChartData('G', 32),
      ChartData('Others', 52)
    ];
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 500,
                height: 500,
                child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(
                        enable: true,
                        textStyle: TextStyle(color: Colors.black),
                        borderColor: Colors.black,
                        borderWidth: 5,
                        color: Colors.white),
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataLabelMapper: (ChartData data, _) => data.x,
                          radius: '60%',
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              // Avoid labels intersection
                              labelIntersectAction: LabelIntersectAction.shift,
                              labelPosition: ChartDataLabelPosition.outside,
                              connectorLineSettings: ConnectorLineSettings(
                                  type: ConnectorType.curve, length: '25%')),
                          enableTooltip: true,
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
              )
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String? x;
  final double? y;
  final Color? color;
}
