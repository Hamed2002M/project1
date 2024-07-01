import 'package:flutter/material.dart';
import 'package:project1univ/models/airplanemodel.dart';

class AirplaneDetailsPage extends StatelessWidget {
  static String id = "Airplane Details";

  AirplaneDetailsPage({required this.airplanedetailes});
  final Airplanedata airplanedetailes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 150, 169, 179),
          title: Text(
            "${airplanedetailes.name}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView(
          children:[ Column(
            children: [
              SizedBox(
                height: 200,
                width: 800,
                child: Container(
                  
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${airplanedetailes.photo}"),
                          fit: BoxFit.fitWidth)),
                          
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Divider(
                  color: Colors.grey,
                  thickness: 5,
                  indent:40 ,
                  endIndent: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.grey,
                  thickness: 5,
                  indent:90 ,
                  endIndent: 90,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
              color:  const Color.fromARGB(255, 150, 169, 179),
                child: 
                  
                
                   Column(
                    children: [
                      
                Text("1 _ Comforts :${airplanedetailes.Comforts}",style:TextStyle(
                  fontSize: 20
                )),
                Text("2 _ Rate : ${airplanedetailes.Rate}",style:TextStyle(
                  fontSize: 20
                )),
                Text("3 _ Food : ${airplanedetailes.food}",style:TextStyle(
                  fontSize: 20
                )),
                Text("4 _ Location : ${airplanedetailes.location}",style:TextStyle(
                  fontSize: 20
                )),
                Text("5 _ Services : ${airplanedetailes.service}",style:TextStyle(
                  fontSize: 20
                )),
                Text("6 _ Safety : ${airplanedetailes.safe}",style:TextStyle(
                  fontSize: 20
                )),
                Text("7 _ More info : ${airplanedetailes.description}",style:TextStyle(
                  fontSize: 20
                )),
                
                    ],
                  ),
                
              )
            ],
          ),]
        ));
  }
}
