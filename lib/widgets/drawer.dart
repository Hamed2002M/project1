import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1univ/models/profilemodel.dart';
import 'package:project1univ/pages/all_trips_page.dart';
import 'package:project1univ/pages/unpayed_trips_page.dart';
import 'package:project1univ/providers/themeprovider.dart';
import 'package:project1univ/service/logoutservice.dart';
import 'package:provider/provider.dart';

class DrawerHomePage extends StatefulWidget {
    DrawerHomePage({required this.userinfoindrawer});
 final Map<ProfileModel, dynamic> userinfoindrawer;

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
ProfileModel ?profileModel ;
  @override
  void initState() {
    super.initState();
    profileModel = widget.userinfoindrawer.keys.first; // تم تعيين قيمة البروفايل من البيانات الممررة إلى الصفحة
  }
   void updateProfileData(ProfileModel updatedProfile) {
    setState(() {
      profileModel = updatedProfile; // تم تحديث بيانات البروفايل بعد التعديل
    });
  }
  @override
  Widget build(BuildContext context) {
     ProfileModel profileModel = widget.userinfoindrawer.keys.first;
    
    return  Drawer(
      
child: ListView(
children: [
UserAccountsDrawerHeader(
  decoration: BoxDecoration(
    color: Colors.blueGrey
  ),
accountName: Text('${profileModel.data.Firstname}${profileModel.data.Lastname}'),
accountEmail: Text('${profileModel.data.email}'),
currentAccountPicture: CircleAvatar(
backgroundImage:NetworkImage("${profileModel.data.visaphoto}"),
),

),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              logout(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Maps'),
            onTap: () {
              // Handle maps action
            },
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Suggestions'),
            onTap: () {
              // Handle suggestions action
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Update Profile'),
            onTap: () {
              Navigator.pushNamed(context, "UpdateProfile");
            },
          ), ListTile(
            leading: Icon(FontAwesomeIcons.tent),
            title: Text('My Trips'),
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AllTrips(),));
            },
          ),
           ListTile(
            leading: Icon(FontAwesomeIcons.paypal),
            title: Text('My UnPayed Trips'),
            onTap: ()async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UnPayedTrips(),));
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) {
                return Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          ),
           
        ],
      ),
    );
  }
}
