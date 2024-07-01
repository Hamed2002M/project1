import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';

class Delet_Trips_service {
  

  Future deletetripservice(int trip_id, BuildContext context) async {
    http.Response response = await http.post(
      Uri.parse("$url/DeleteReserveTrip"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: {
        "idTrip": trip_id.toString(),
      },
    );

    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("تم حذف الرحلة");
    } else {
      showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Oops"),
                content: Text("${responseData['message']}"),
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
      print("Error deleting trip: ${response.statusCode} - ${responseData['message']}");
    }
  }
}