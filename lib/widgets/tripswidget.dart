import 'package:flutter/material.dart';
import 'package:project1univ/models/gettripmodel.dart';
import 'package:project1univ/pages/reservetrip.dart';

class TripsWidget extends StatelessWidget {
  final TripData trip;

  TripsWidget({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 150, 169, 179),
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReserveTrip(tripforreserve: trip,),));
        },
        child: Container(
          width: 200,
          height: 300,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(country.),
          //     fit: BoxFit.cover,
          //   ),
          //   borderRadius: BorderRadius.circular(50),
          // ),
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 18,
                child: Text(
                  "${trip.amountpeople}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                
              ),
               Positioned(
                top: 20,
                left: 18,
                child: Text(
                  "${trip.companyName}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                
              ),
               Positioned(
                top: 40,
                left: 18,
                child: ElevatedButton(onPressed: (){}, child:Text("hamed") )
                
              ),
              // Positioned(
              //     top: 190,
              //     right: BorderSide.strokeAlignCenter,
              //     child: country.rate == "High"
              //         ? Icon(
              //             Icons.favorite,
              //             color: Colors.red,
              //           )
              //         : Text(
              //             "Not Recommended ",
              //             style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Pacifico"),
              //           )),
            ],
          ),
        ),
      ),
    );
  }
}
