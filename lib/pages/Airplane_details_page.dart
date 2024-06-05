import 'package:flutter/material.dart';
import 'package:project1univ/models/airplanemodel.dart';

class AirplaneDetailsPage extends StatelessWidget {
  static String id = "Airplane Details";
 
   AirplaneDetailsPage({required this.airplanedetailes});
 final Airplanedata airplanedetailes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${airplanedetailes.name}",style: TextStyle(
        fontSize: 20
      ),),),
    );
  }
}
