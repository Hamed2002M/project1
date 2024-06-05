import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/service/drawerfuturebuilder.dart';
import 'package:project1univ/widgets/bottomnavigatorbar.dart';

import 'package:project1univ/widgets/taBbarviewhomepage.dart';

import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    textDirectionToAxisDirection(TextDirection.ltr);
    return DefaultTabController(
      
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 150, 169, 179),
          title: Text('Home'),
          bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Icon(
                  FontAwesomeIcons.airbnb,
                  color: Colors.black.withOpacity(1),
                ),
                child: Text('Trips'),
              ),
              Tab(
                icon: Icon(
                  Icons.food_bank,
                  color: Colors.black.withOpacity(1),
                ),
                child: const Text('Resturants'),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.hotel,
                    color: Colors.black.withOpacity(1)),
                child: const Text("Hotels"),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.fly,
                    color: Colors.black.withOpacity(1)),
                child: const Text("Airlines"),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.mountain,
                  color: Colors.black.withOpacity(1),
                ),
                child: const Text('Countries'),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text(
                'Account Balance: \$500',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        drawer:DrawerFutureBuilder(),
        body: TabBarViewHomePage(),
        bottomNavigationBar: BottomnavigationBar()
      ),
    );
  }
}
