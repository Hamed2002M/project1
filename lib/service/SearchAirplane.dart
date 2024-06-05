// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:project1univ/main.dart';
// import 'package:project1univ/models/SearchAirplaneModel.dart';

// class Searchairplane {
//   Future<SearchAirplaneModel> searchAirplane(
// String airplaneyName,
// BuildContext context,
//   ) async {
//     http.Response response = await http.post(
//       Uri.parse('$url/SearchAboutAirPlaneCompany'),
//       body: {
//         "name": airplaneyName,
//       },
//       headers: {
//         "Accept": "application/json",
//         "Authorization": "Bearer $token",
//       },
//     );

//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       SearchAirplaneModel SearchAirplaneModelbyname =
//           SearchAirplaneModel.fromjson(data);
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text(SearchAirplaneModelbyname.data.name),
//             content: Container(
//               height: 200,
//               width: 200,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Rate : ${SearchAirplaneModelbyname.data.Rate}"),
//                   // Image.network(searchcountrybyname.data.photo),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Close"),
//               ),
//             ],
//           );
//         },
//       );
//       return SearchAirplaneModelbyname;
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text("Country not found"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Close"),
//               ),
//             ],
//           );
//         },
//       );
//       throw Exception('Failed to search for airplane');
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/searchcountrymodel.dart';

class Searchairplaneservice {
  Future<SearchCountryModel?> Searchairplane(
    String airplaneyName,
    BuildContext context,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutAirPlaneCompany"),
        body: {
          "name": airplaneyName,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        SearchCountryModel searchairplanebyname =
            SearchCountryModel.fromjson(data);

        if (searchairplanebyname.data != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(searchairplanebyname.data!.name),
                content: Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(searchairplanebyname.data!.photo),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 190,
                            right: BorderSide.strokeAlignCenter,
                            child: searchairplanebyname.data!.rate == "High"
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Text(
                                    "Not Recommended ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontFamily: "Pacifico"),
                                  )),
                      ],
                    )),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            },
          );
          return searchairplanebyname;
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("airplane Not Found"),
                content: Text("The airplane you searched for was not found."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            },
          );
          return null;
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Failed to search for the airplane."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            );
          },
        );
        return null;
      }
    } catch (e) {
      print("فات عال catch: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content:
                Text("An error occurred while searching for the airplane."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    }
    return null;
  }
}
