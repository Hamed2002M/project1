import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1univ/main.dart';
import 'package:project1univ/models/searchtripviacountryorcompanymodel.dart';

class Searchtripviacountryorcompanyservice {
  Future<SearchTripViaCountryOrCompanyModel?> searchTripViaCountryOrCompanyService(String searchVariable) async {
    http.Response response = await http.post(
      Uri.parse("$url/getCompanyORCountryWithTrips"),
      body: <String, dynamic>{"CompanyORCountry": searchVariable},
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      print("فات عرض الرحل حسب البلد");
     var responsedata = jsonDecode(response.body);
     print(responsedata);
        return SearchTripViaCountryOrCompanyModel.fromJson(responsedata);
    } else {
      print("وخرا");
      throw Exception('Failed to load search trip data');
    }
  }
}
