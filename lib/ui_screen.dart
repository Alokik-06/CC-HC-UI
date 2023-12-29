// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UiPage extends StatefulWidget {
  const UiPage({super.key});

  @override
  State<UiPage> createState() => _UiPageState();
}

class _UiPageState extends State<UiPage> {
  late List<_ChartData> cdata;
  late List<_ChartData> hdata;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    cdata = [
      _ChartData('EUR', 60, Colors.black),
      _ChartData('GBP', 12, Color.fromARGB(255, 178, 200, 226)),
      _ChartData('USB', 6, Color.fromARGB(255, 134, 147, 155)),
      _ChartData('RUB', 11, Colors.black),
      _ChartData('NOK', 4, Color.fromARGB(255, 57, 83, 101)),
      _ChartData('AUD-5%', 7, Color.fromARGB(255, 135, 145, 150)),
    ];

    hdata = [
      _ChartData('DTEREN 8 1/2', 56, Colors.black),
      _ChartData('RFLB 6.9', 81, Color.fromARGB(255, 150, 147, 147)),
      _ChartData('RFLB 7.65', 54, Color.fromARGB(255, 84, 83, 110)),
      _ChartData('RUSSIA 5 5/8', 70, Colors.black),
      _ChartData('DTEKUA 7 1/2', 122, Color.fromARGB(255, 125, 133, 149)),
      _ChartData('AXASA', 28, const Color.fromARGB(255, 162, 195, 211)),
      _ChartData('ABNANV', 40, Colors.black),
    ];

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI"),
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 240, 240, 240),
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Balances',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$(6,977,736)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.crop_free_rounded),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 250,
                            width: double.infinity,
                            child: SfCircularChart(
                              borderWidth: 1,
                              margin: EdgeInsets.all(10),
                              series: [
                                DoughnutSeries<_ChartData, String>(
                                  dataSource: cdata,
                                  legendIconType: LegendIconType.circle,
                                  radius: '120%',
                                  pointColorMapper: (_ChartData cdata, _) =>
                                      cdata.color,
                                  xValueMapper: (_ChartData cdata, _) =>
                                      cdata.x,
                                  yValueMapper: (_ChartData cdata, _) =>
                                      cdata.y,
                                  startAngle: 270,
                                  endAngle: 90,
                                ),
                              ],
                              legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                position: LegendPosition.bottom,
                                textStyle: TextStyle(fontSize: 18),
                                offset: Offset(20, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.white,
                      ),
                      child: ExpansionTile(
                        title: Text(
                          'Positions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$563,218,035",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.crop_free_rounded),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(0),
                            height: 250,
                            width: double.infinity,
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 1,

                              margin: EdgeInsets.all(10),
                              isTransposed: false,

                              // X Axis...

                              primaryXAxis: CategoryAxis(
                                isVisible: true,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                                axisLine: AxisLine(width: 1, dashArray: [3, 3]),
                                majorGridLines:
                                    MajorGridLines(width: 1, dashArray: [3, 3]),
                                majorTickLines: MajorTickLines(width: 0),
                              ),

                              // Y Axis...

                              primaryYAxis: NumericAxis(
                                labelFormat: '{value}M',
                                minimum: 0,
                                maximum: 130,
                                interval: 20,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                  fontSize: 12,
                                ),
                                axisLine: AxisLine(width: 1, dashArray: [3, 3]),
                                majorGridLines:
                                    MajorGridLines(width: 1, dashArray: [3, 3]),
                                majorTickLines: MajorTickLines(width: 0),
                              ),
                              tooltipBehavior: _tooltip,
                              series: <CartesianSeries<_ChartData, String>>[
                                BarSeries<_ChartData, String>(
                                  dataSource: hdata,
                                  width: 0.5,
                                  spacing: 0.2,
                                  pointColorMapper: (_ChartData hdata, _) =>
                                      hdata.color,
                                  xValueMapper: (_ChartData hdata, _) =>
                                      hdata.x,
                                  yValueMapper: (_ChartData hdata, _) =>
                                      hdata.y,
                                  dataLabelSettings: DataLabelSettings(
                                    isVisible: false,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
