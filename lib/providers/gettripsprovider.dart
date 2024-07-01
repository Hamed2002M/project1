import 'package:flutter/material.dart';
import 'package:project1univ/models/tripmodel.dart';
import 'package:project1univ/service/get_reserve_trips_service.dart';

class GetTripProvider with ChangeNotifier {
  List<Tripinfo>? _tripdata;

  List<Tripinfo>? get tripdata => _tripdata;

  
  Future<void> fetchBalanceData() async {
    _tripdata = await GetReserveTrips().getreservetrips();
    notifyListeners();
  }
}