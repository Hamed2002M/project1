import 'package:flutter/material.dart';
import 'package:project1univ/models/countrymodel.dart';
import 'package:project1univ/pages/tripsWithCountry.dart';

class CountrWidget extends StatelessWidget {
  final CountryData country;

  CountrWidget({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 169, 179),
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TripsWithCountry(countryforsearchtrip: country,),));
        },
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(country.photo),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 18,
                child: Text(
                  "${country.name}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Positioned(
                  top: 190,
                  right: BorderSide.strokeAlignCenter,
                  child: country.rate == "High"
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Text(
                          "Not Recommended ",
                          style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Pacifico"),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
