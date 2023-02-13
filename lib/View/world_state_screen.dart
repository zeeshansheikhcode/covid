import 'package:covid_app/View/countries_list.dart';
import 'package:covid_app/services/utilities/state_service.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/world_state_model.dart';
import 'detail_screen.dart';
class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> with TickerProviderStateMixin{
   
  final colorlist = <Color>
  [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: 
              [
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                FutureBuilder(
                    future:  stateServices.fetchWorldStates(),
                    builder: (context,AsyncSnapshot<WorldStateModel> snapshot) {
                  if(!snapshot.hasData)
                    { 
                      print('here1');
                      return
                     const Center(child: Text('Loading...',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),));
                    
                    }
                  else
                    {  print('here2');
                      return Column(
                        children: [
                          PieChart(
                            dataMap:
                              {
                                "Total"     : double.parse(snapshot.data!.cases.toString()),
                                "Recovered" : double.parse(snapshot.data!.recovered.toString()),
                                "Death"     : double.parse(snapshot.data!.deaths.toString()),

                            },
                            chartRadius: MediaQuery.of(context).size.width/3.2,
                            chartValuesOptions:  const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            animationDuration: const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorlist,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.06),
                            child: Card(
                              child: Column(
                                children:
                                [
                                  ReuseableRow(title: 'Total',     value: snapshot.data!.cases.toString()),
                                  ReuseableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                  ReuseableRow(title: 'Death',     value: snapshot.data!.deaths.toString()),
                                  ReuseableRow(title: 'Active',     value: snapshot.data!.active.toString()),
                                  ReuseableRow(title: 'Critical',         value: snapshot.data!.critical.toString()),
                                  ReuseableRow(title: 'Today Death',      value: snapshot.data!.todayDeaths.toString()),
                                  ReuseableRow(title: 'Today Recovered',  value: snapshot.data!.todayRecovered.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap : ()
                               {
                                 Navigator.push(context, 
                                 MaterialPageRoute(builder: (context)=>CountriesList()));
                               },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:const Center(child: Text('Track Countries'),),
                            ),
                          )
                        ],
                      );
                    }
                }),

              ],
            ),
          ),
           ),
          ),

    );
  }
}
