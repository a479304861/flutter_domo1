import 'package:flutter/material.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/bar_chart/bar_chart_page2.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/bar_chart/samples/bar_chart_sample5.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/line_chart_page2.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/line_chart_page3.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/line_chart_page4.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample3.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample4.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample5.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample6.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample7.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/line_chart/samples/line_chart_sample8.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/pie_chart/pie_chart_page.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/pie_chart/samples/pie_chart_sample1.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/pie_chart/samples/pie_chart_sample2.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/pie_chart/samples/pie_chart_sample3.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/scatter_chart/samples/scatter_chart_sample1.dart';
import 'package:flutter_domo1/smallDemo/Chart/lib/scatter_chart/samples/scatter_chart_sample2.dart';

import 'Chart/lib/bar_chart/bar_chart_page.dart';
import 'Chart/lib/bar_chart/samples/bar_chart_sample3.dart';
import 'Chart/lib/bar_chart/samples/bar_chart_sample4.dart';
import 'Chart/lib/line_chart/line_chart_page.dart';
import 'Chart/lib/line_chart/samples/line_chart_sample1.dart';
import 'Chart/lib/line_chart/samples/line_chart_sample2.dart';
import 'Chart/lib/scatter_chart/scatter_chart_page.dart';

class ChartDemo extends StatefulWidget {
  @override
  _ChartDemoState createState() => _ChartDemoState();
}

class _ChartDemoState extends State<ChartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: <Widget>[
            BarChartPage(),
            BarChartPage2(),
            BarChartSample3(),
            BarChartSample4(),
            BarChartSample5(),
            LineChartSample1(),
            LineChartSample2(),
            LineChartSample3(),
            LineChartSample4(),
            LineChartSample5(),
            LineChartSample6(),
            LineChartSample7(),
            LineChartSample8(),
            PieChartSample1(),
            PieChartSample2(),
            PieChartSample3(),
            ScatterChartSample1(),
            ScatterChartSample2(),
          ],
        ),
      ),
    );
  }
}
