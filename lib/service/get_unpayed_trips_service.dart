import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:http/http.dart' as http;

class GetUnPayedTrips {
  Future<List<Tripinfo>> getunpayedtrips() async {
    http.Response response = await http.get(
      Uri.parse("$url/getunpayedtrip"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      print("Successfully fetched unpayed trips");
      var responseData = jsonDecode(response.body);
      List<Tripinfo> trips = [];
      for (var trip in responseData["data"]) {
        trips.add(Tripinfo.fromJson(trip));
      }
      return trips;
    } else {
      print("Error fetching reserved trips: ${response.statusCode}");
      throw Exception('Failed to fetch reserved trips');
    }
  }
}