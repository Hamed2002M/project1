import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/searchcountrymodel.dart';

class SearchCountry {
  Future<SearchCountryModel?> searchCountry(
    String countryName,
    BuildContext context,
  ) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$url/SearchAboutContrey"),
        body: {
          "name": countryName,
        },
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        SearchCountryModel searchcountrybyname = SearchCountryModel.fromjson(data);

        if (searchcountrybyname.data != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(searchcountrybyname.data!.name),
                content: GestureDetector(
                  onTap: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => TripsWithCountry(),))
                  },
                  child: Container(
                     width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(searchcountrybyname.data!.photo),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                    child: Stack(children: [
                            Positioned(
                  top: 190,
                  right: BorderSide.strokeAlignCenter,
                  child: searchcountrybyname.data!.rate == "High"
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Text(
                          "Not Recommended ",
                          style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Pacifico"),
                        )),
                    ],)
                  ),
                ),
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
          return searchcountrybyname;
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Country Not Found"),
                content: Text("The country you searched for was not found."),
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
              content: Text("Failed to search for the country."),
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
            content: Text("An error occurred while searching for the country."),
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