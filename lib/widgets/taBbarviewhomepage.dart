import 'package:flutter/material.dart';
import 'package:project1univ/widgets/FutureBuilderAirplane.dart';
import 'package:project1univ/widgets/futurebuidertripinhomepage.dart';
import 'package:project1univ/widgets/futurebuildercountry.dart';

class TabBarViewHomePage extends StatelessWidget {
  const TabBarViewHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Container(
       child :  Container(
        child: FutureBuilderTrip()
      ),),
      Container(
        child: Text('Tab 2 Content'),
      ),
      Container(
        child: Text('Tab 3 Content'),
      ),
      Container(
        decoration: BoxDecoration(color:   Color.fromARGB(255, 150, 169, 179),),
        child: FutureBuilderAirplane()
      ),
      Container(
          decoration: BoxDecoration(color:   Color.fromARGB(255, 150, 169, 179),),
          child: FutureBuilderCountry()),
    ]);
  }
}
