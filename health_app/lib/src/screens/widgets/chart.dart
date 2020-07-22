import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Charts extends StatefulWidget {
  final int numPatients;
  final int numDoctors;
//Kindly send appropriate initializers for your screens. Other wise it takes 0 and 0 as patient and doctors
  Charts({this.numPatients = 0, this.numDoctors = 0});
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var data1 = [
      new Pollution(1980, '', widget.numDoctors),
    ];
    var data2 = [
      new Pollution(1985, '', widget.numPatients),
    ];

    var piedata = [
      new Task('Patients', widget.numPatients.toDouble(), Color(0xff3366cc)),
      new Task('Doctors', widget.numDoctors.toDouble(), Color(0xff990099)),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: 'doctors',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffA4E6DC)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: 'patients',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff9EDAFE)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  void initState() {
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        charts.BarChart(
          _seriesData,
          animate: true,
          barGroupingType: charts.BarGroupingType.grouped,
          behaviors: [charts.SeriesLegend()],
          animationDuration: Duration(seconds: 5),
        ),
        charts.PieChart(
          _seriesPieData,
          animate: true,
          animationDuration: Duration(seconds: 5),
          behaviors: [
            new charts.DatumLegend(
              outsideJustification: charts.OutsideJustification.endDrawArea,
              horizontalFirst: false,
              desiredMaxRows: 2,
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              entryTextStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.purple.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 11),
            )
          ],
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 100,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.inside)
            ],
          ),
        ),
      ],
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
