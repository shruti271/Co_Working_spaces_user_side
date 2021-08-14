// import 'package:coworking_space/screen/profile/help_screen/help_screen.dart';
import 'package:coworking_space/screen/profile/components/edit_profile_infp.dart';

import 'package:coworking_space/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'demo_profile_info.dart';
import 'profile_menu.dart';
// import 'profile_pic.dart';
// import 'edit_screen.dart';
import 'settings_screen.dart';
import 'logout.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          //  ProfilePage(),
          SizedBox(height: 15),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: ()  { 
              Navigator.push(context,MaterialPageRoute(builder: (context) => Editallinfo()),//Editallinfo
              // Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileInfo()),
                  );
              //  Navigator.pushNamed(context, EditProfilePage.routeName);
             },
          ),
          ProfileMenu(
            text: "My Payment",
            icon: "assets/icons/receipt.svg",
            press: ()  { 
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
              //  Navigator.pushNamed(context, EditProfilePage.routeName);
             },
          ),
          // ProfileMenu(
          //   text: "Help",
          //   icon: "assets/icons/Call.svg",
          //   press: ()  { 
          //     Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => HelpScreen()),
          //         );
          //     //  Navigator.pushNamed(context, EditProfilePage.routeName);
          //    },
          // ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
               final prefs = await SharedPreferences.getInstance();
               prefs.clear();
                      // prefs.setString('current_login_user', "");
                      // prefs.setString('current_login_user_email', element.documents[i]['email']);
                      // prefs.setString('current_login_user_phonenumber', element.documents[i]['phone number']);
                      // prefs.setString('current_login_user_name', element.documents[i]['firstname']+" "+element.documents[i]['lastname']);
               Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogOut()),
                  );
            },
          ),
        ],
      ),
    );
  }
}
