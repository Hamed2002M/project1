import 'package:flutter/material.dart';
import 'package:project1univ/service/SearchAirplane.dart';
import 'package:project1univ/service/get_airplancompany.dart';
import 'package:project1univ/widgets/AirplaneWidget.dart';

// ignore: must_be_immutable
class FutureBuilderAirplane extends StatefulWidget {
  FutureBuilderAirplane({super.key});

  @override
  State<FutureBuilderAirplane> createState() => _FutureBuilderAirplaneState();
}

class _FutureBuilderAirplaneState extends State<FutureBuilderAirplane> {




@override
void initState() {
  super.initState();
  Future.delayed(Duration.zero, () {
    final snackBar = SnackBar(content: Text('Click once to see company details and twice to see trips within the company'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}

  TextEditingController searchairplanenamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextField(
            controller: searchairplanenamecontroller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Searchairplaneservice().Searchairplane(
                        searchairplanenamecontroller.text, context);
                  },
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "Search by Airplane company name",
                hintStyle: TextStyle(fontFamily: "Pacifico")),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: FutureBuilder(
              future: GetAirplancompany().getAirpalncompany(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print('يحتوي بيب سبيرسي');

                  return Text("something went wrong");
                }
                if (snapshot.hasData) {
                  print('يحتوي داتا');
                  final companyList = snapshot.data!;
                  print("1");
                  return GridView.builder(
                    
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    
                    itemCount: companyList.data.length,
                    itemBuilder: (context, index) {
                      var airplane = companyList.data[index];
                       print("2");
                      return Airplanewidget(airplane: airplane);
                    },
                  );
                } else {
                  print('  يحتوي  لا داتا');
                }

                return Container();
              },
            ),
          ),
        )
      ],
    );
  }
}
