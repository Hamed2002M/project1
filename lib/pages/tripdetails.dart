import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripDetails extends StatelessWidget {
   TripDetails({super.key,required this.tripdetails,});
 var tripdetails ;
 
  @override

  Widget build(BuildContext context) {
    var trip = tripdetails[0].trip;
    return  Scaffold(
      
      body: Card(
        
                elevation: 8,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Twords: ${trip.twords}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Price: \$${trip.price}',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Twords: ${trip.amountofpeopleinttrip}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Twords: ${trip.timetrip}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         Text(
                            'Twords: ${tripdetails[0].fathername}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                            
                        ],
                      ),
                     
                    ],
                  ),
                ),
              ),
    );
  }
}