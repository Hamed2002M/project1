import 'package:flutter/material.dart';
import 'package:project1univ/models/airplanemodel.dart';
import 'package:project1univ/pages/Airplane_details_page.dart';
import 'package:project1univ/pages/tripswithcompany.dart';

// class Airplanewidget extends StatelessWidget {
//   const Airplanewidget({super.key, required this.airplane});
// final Airplanedata airplane;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: 400,
//             decoration: BoxDecoration(boxShadow: [
//               BoxShadow(
//                   blurRadius: 20,
//                   color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
//                   spreadRadius: 1,
//                   offset: Offset(10, 10)),
//             ]),
//             width: 180,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Card(
//                 elevation: 5,
//                 color: Colors.white,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Name:${airplane.name}",
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Rate:${airplane.Rate}"),
//                           Icon(
//                             Icons.favorite,
//                             color: Colors.red,
//                           )
//                         ],
//                       ),
//                       Text(
//                         "Name:${airplane.description}",
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                       Text(
//                         "Name:${airplane.safe}",
//                         style: TextStyle(color: Colors.black, fontSize: 16),
//                       ),
//                       SizedBox(
//                         height: 4,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class Airplanewidget extends StatelessWidget {
  Airplanewidget({Key? key, required this.airplane}) : super(key: key);
  final Airplanedata airplane;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 150, 169, 179),
      body: GestureDetector(
        onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: ((context) => AirplaneDetailsPage(airplanedetailes: airplane,) )));
        },
        onDoubleTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TripsWithAirplane(airplaneforsearchtrip: airplane),));
        },
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("${airplane.photo}"),
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
                  "${airplane.name}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Positioned(
                  top: 190,
                  right: BorderSide.strokeAlignCenter,
                  child: airplane.Rate == "High"
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Text(
                          "Not Recommended ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
