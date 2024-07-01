import 'package:flutter/material.dart';
import 'package:project1univ/models/searchtripviacountryorcompanymodel.dart';

class SearchTripwidget extends StatefulWidget {
  final SearchTripDataModel searchwidget ;

  SearchTripwidget({Key? key, required this.searchwidget}) : super(key: key);

  @override
  State<SearchTripwidget> createState() => _SearchTripwidgetState();
}

class _SearchTripwidgetState extends State<SearchTripwidget> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 150, 169, 179),
      body: Container(
        width: 300,
        height: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Card(
           shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50), 
  ),
          child: Container(
             decoration: BoxDecoration(
              color: Colors.white,
          image: DecorationImage(image: AssetImage("images/trip.jpg"),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(50),
        ),
            child: Column
            (
              children: [
                Text("Trip Place : ${widget.searchwidget.tripplace}"),
                Text("Twords : ${widget.searchwidget.towards}"),
                Text("Tima Trip:${widget.searchwidget.timetrip}"),
                Text("Price : ${widget.searchwidget.price}"),
                Text("Flight Company : ${widget.searchwidget.flightcompanyid}"),
Text("Country : ${widget.searchwidget.countryid}"),
                Text("Amount of people : ${widget.searchwidget.amountofpeople}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: ElevatedButton(onPressed: (){}, child:Text("Reservation"),style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 150, 169, 179))
                      ),),
                    )
                  ],
                )
              ],
            ),
          )
          ,
        )
      ),
    );
  }
}
