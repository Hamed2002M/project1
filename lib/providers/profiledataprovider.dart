import 'package:flutter/material.dart';
import 'package:project1univ/models/profilemodel.dart';
import 'package:project1univ/service/getuserprofileservice.dart';
import 'package:provider/provider.dart';

class ProfileDataProvider with ChangeNotifier{
  ProfileModel? _profile ;
    ProfileModel? get profile => _profile ;
    void setprofile(){
      _profile = profile ;
      Listener() ;
    }
}