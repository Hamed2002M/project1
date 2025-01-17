import 'package:flutter/material.dart';
import 'package:project1univ/service/getcountries.dart';
import 'package:project1univ/service/searchcountry.dart';
import 'package:project1univ/widgets/countrieswidget.dart';

// ignore: must_be_immutable
class FutureBuilderCountry extends StatefulWidget {
   FutureBuilderCountry({super.key});

  @override
  State<FutureBuilderCountry> createState() => _FutureBuilderCountryState();
  
}

class _FutureBuilderCountryState extends State<FutureBuilderCountry> {
  @override
void initState() {
  super.initState();
  Future.delayed(Duration.zero, () {
    final snackBar = SnackBar(content: Text('Click On Country to see the Trips in it'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}
TextEditingController searchcountrynamecontroller= TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextField(
              controller: searchcountrynamecontroller,
              decoration: InputDecoration(
                  prefixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){
                    SearchCountry().searchCountry(searchcountrynamecontroller.text,context);
                  },),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Search by country name",
                  hintStyle: TextStyle(fontFamily: "Pacifico")),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FutureBuilder(
                future: GetCountries().getCountries(),
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
                    final countryList = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      
                      ),
                      itemCount: countryList.data.length,
                      itemBuilder: (context, index) {
                        final country = countryList.data[index];
                        return CountrWidget(country: country);
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
          )
        ]);
  }
}