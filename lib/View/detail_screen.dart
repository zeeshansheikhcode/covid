import 'package:flutter/material.dart';
class Detailscreen extends StatefulWidget {
  String image;
  String name;
  int totalDeaths,active,critical,todayRecovered;
   Detailscreen({super.key,
   required this.image,
   required this.name,
  // required this.totalCases,
   required this.totalDeaths,
 //  required this.totalRecovered,
   required this.todayRecovered,
   required this.active,
   required this.critical,
  // required this.test,
   });
  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067),
                 child: Card(
                  child: Column(
                    children: 
                    [   SizedBox(height: MediaQuery.of(context).size.height * .067,),
                        // ReuseableRow(title: 'Cases',            value: widget.totalCases.toString()),
                         ReuseableRow(title: 'Recovered',        value: widget.todayRecovered.toString()),
                         ReuseableRow(title: 'Critical',         value: widget.critical.toString()),
                         ReuseableRow(title: 'Active',           value: widget.active.toString()),                                 
                         ReuseableRow(title: 'Death',            value: widget.totalDeaths.toString()),
                         ReuseableRow(title: 'Today Recovered',  value: widget.todayRecovered.toString()),
                            
                    ],
      
                  ),
                 ),
                ),
                CircleAvatar(radius: 50,
               backgroundImage :NetworkImage(widget.image),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
class ReuseableRow extends StatelessWidget {
  final String title,value;
 const ReuseableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text(title),
              Text(value),
              
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}