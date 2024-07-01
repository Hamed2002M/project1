import 'package:flutter/material.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:project1univ/service/get_unpayed_trips_service.dart';

class GetUnPayedTripProvider with ChangeNotifier {
  List<Tripinfo>? _unpayedtripdata;

  List<Tripinfo>? get tripdata => _unpayedtripdata;

  
  Future<void> fetchBalanceData() async {
    _unpayedtripdata = await GetUnPayedTrips().getunpayedtrips();
    notifyListeners();
  }
}