import 'package:flutter/material.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:project1univ/service/get_reserve_trips_service.dart';

class BottomnavigationBar extends StatelessWidget {
   BottomnavigationBar({super.key});

  @override
  
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.lightbulb),
        ),
        ElevatedButton(
          onPressed: () {
          
          }
,          child: const Icon(Icons.map),
        ),
        ElevatedButton(
          onPressed: () async{
     List<Tripinfo>? model = await GetReserveTrips().getreservetrips();
    
    print(model[0].amountofpeopleforcostumer);

          },
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
