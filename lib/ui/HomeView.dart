


// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:beta_app/ui/life_meaning_model.dart';
import 'package:beta_app/ui/login.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
   
  @override
  
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
   late List<_ChartData> data;
  // late TooltipBehavior _tooltip;
  bool value = false;
  @override
    void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    // _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  
  Widget build(BuildContext context) {
      //  final List<ChartData> chartData= [
      //       ChartData('A',70, Colors.teal),
      //       ChartData('B', 5, Colors.orange),
      //       ChartData('C',15, Colors.brown),
      //       ChartData('D',10, Colors.deepOrange),
           
      //   ];
        


    return ChangeNotifierProvider(
      create: (_)=>LifeMeaningModel(context),
      child:MaterialApp(
        home: Phone_view(),
      )

    );
  }}
  class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}