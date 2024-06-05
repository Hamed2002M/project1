
import 'package:flutter/material.dart';
import 'package:project1univ/pages/Airplane_details_page.dart';
import 'package:project1univ/pages/homepage.dart';
import 'package:project1univ/pages/login.dart';
import 'package:project1univ/pages/signUpPage.dart';
import 'package:project1univ/pages/updateprofile.dart';
import 'package:project1univ/providers/themeprovider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 String token = "" ;
  String url = "http://10.0.2.2:8000/api" ;
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
             routes: {
            Login.id : (context) => Login(),
            HomePage.id : (context) => HomePage(),
            SignUpPage.id : (context) => SignUpPage(),
            UpdateProfile.id : (context) => UpdateProfile(),
            
          },
          initialRoute: Login.id,
            title: 'Dark Mode Example',
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            
          );
        },
      ),
    );
  }
}