import 'package:covid_app/View/detail_screen.dart';
import 'package:covid_app/services/utilities/state_service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      // appBar: AppBar(
      //   title:const Text('Countries'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          children: 
          [ 
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
               controller: _searchController,
               onChanged: ((value) {
                 setState(() {
                   
                 });
               }),
               decoration: InputDecoration(
                hintText: 'Search By Country Name',
                contentPadding:  const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                )
               ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.fetchCountries(),
                builder: ((context,AsyncSnapshot<List<dynamic>> snapshot) 
                { if(!snapshot.hasData)
                   {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) 
                      { 
                 return  Shimmer.fromColors(
                          
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                          children: [
                            ListTile(
                              title:    Container(height: 10,width: 89, color: Colors.white, ),
                              subtitle: Container(height: 10,width: 89, color: Colors.white, ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                                // child: Image(
                                //   height: 50,
                                //   width: 50,
                                //   image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                              ),
                            ),
                          ],
                        ),
                      );  
                    }),
                   );
                   }
                   else
                   { return
                     ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) 
                      { String name =  snapshot.data![index]['country'];
                        if(_searchController.text.isEmpty)
                        {
                          return
                          Column(
                          children: [
                            ListTile(
                              onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailscreen(
                image          : snapshot.data![index]['countryInfo']['flag'],
                name           : snapshot.data![index]['country'],
             //   test           : snapshot.data![index]['test'],
              //  totalCases     : snapshot.data![index]['totalCases'],
                todayRecovered : snapshot.data![index]['todayRecovered'],
                active         : snapshot.data![index]['active'],
                critical       : snapshot.data![index]['critical'],
             //   totalRecovered : snapshot.data![index]['totalRecovered'],
                totalDeaths    : snapshot.data![index]['deaths'],
              )));
                             
                              }),
                              title:    Text(snapshot.data![index]['country']),
                              subtitle: Text(snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                            ),
                          ],
                        );
            
                        }
                        else if(name.toLowerCase().contains(_searchController.text.toLowerCase()))
                        {
                          return
                          Column(
                          children: [
                            ListTile(
                               onTap: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailscreen(
                image          : snapshot.data![index]['countryInfo']['flag'],
                name           : snapshot.data![index]['country'],
             //   test           : snapshot.data![index]['test'],
              //  totalCases     : snapshot.data![index]['totalCases'],
                todayRecovered : snapshot.data![index]['todayRecovered'],
                active         : snapshot.data![index]['active'],
                critical       : snapshot.data![index]['critical'],
                //totalRecovered : snapshot.data![index]['totalRecovered'],
                totalDeaths    : snapshot.data![index]['deaths'],
              )));
                             
                              }),
                            
                              title:    Text(snapshot.data![index]['country']),
                              subtitle: Text(snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                            ),
                          ],
                        );
                        }
                        else
                        {
                           return const SizedBox();
                        }
                        
                        
                      }),
                      );
                   }
                })),
            )

          ],
         ),
        ) ,
    );
  }
}
