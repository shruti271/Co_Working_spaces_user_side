import 'package:coworking_space/constants.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
import 'package:coworking_space/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile" , style: TextStyle( color:kPrimaryColor),),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
