import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/providers/balanceprovider.dart';
import 'package:project1univ/service/drawerfuturebuilder.dart';
import 'package:project1univ/widgets/bottomnavigatorbar.dart';
import 'package:project1univ/widgets/taBbarviewhomepage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<BalanceProvider>().fetchBalanceData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BalanceProvider>(
      builder: (context, balanceProvider, child) {
        if (balanceProvider.balanceData == null) {
          return const CircularProgressIndicator();
        }

        final balance = balanceProvider.balanceData?[0].balancee ?? 0;

        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 150, 169, 179),
              title: Text('Home'),
              bottom: 
               
                  TabBar(
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
               
                  // Your tab definitions
                
              
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'Account Balance: ${balance}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            drawer: DrawerFutureBuilder(),
            body:  TabBarViewHomePage(),
            bottomNavigationBar:  BottomnavigationBar(),
          ),
        );
      },
    );
  }
}