import 'package:flutter/material.dart';
import 'package:project1univ/models/countrymodel.dart';
import 'package:project1univ/service/searchtripviacountryorcomapnyservice.dart';
import 'package:project1univ/widgets/searchtripwidget.dart';

class TripsWithCountry extends StatelessWidget {
   TripsWithCountry({required this.countryforsearchtrip});
 final CountryData countryforsearchtrip ;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 150, 169, 179),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 150, 169, 179),
        title: Center(child: Text("Trips In This Country")),
      ),
      body:  FutureBuilder(
                future: Searchtripviacountryorcompanyservice().searchTripViaCountryOrCompanyService("${countryforsearchtrip.name}"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print(snapshot.data);
                    return Text("something went wrong");
                  }
                  if (snapshot.hasData) {
                    final tripList = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      
                      ),
                      itemCount: tripList.data.length,
                      itemBuilder: (context, index) {
                        final trips = tripList.data[index];
                        return SearchTripwidget(searchwidget: trips);
                      },
                    );
                  }
                  return Container();
                },
              ),);
    
  }
}