import 'package:flutter/material.dart';
import 'package:project1univ/pages/tripdetails.dart';
import 'package:project1univ/providers/get_unpaed_trips_provider.dart';
import 'package:provider/provider.dart';

class UnPayedTrips extends StatefulWidget {
  const UnPayedTrips({super.key});

  @override
  State<UnPayedTrips> createState() => _AllTripsState();
}

class _AllTripsState extends State<UnPayedTrips> {
  @override
  void initState() {
    super.initState();
    context.read<GetUnPayedTripProvider>().fetchBalanceData();
     Future.delayed(Duration.zero, () {
    final snackBar = SnackBar(content: Text('Click to see Trip Details'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetUnPayedTripProvider>(
      builder: (context, tripProvider, child) {
        if (tripProvider.tripdata == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final trips = tripProvider.tripdata!;
        return Scaffold(
          body: ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index].trip;
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TripDetails(tripdetails: trips,)));
                },
                child: Card(
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
                              'Price: \$${trip.amountofpeopleinttrip}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // var y =trips[index].id;
                            // Delet_Trips_service().deletetripservice(y,context);
                          },
                          child: Text('Pay'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}