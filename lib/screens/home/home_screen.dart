// necessary for shruti
import 'package:flutter/material.dart';
import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
import 'package:coworking_space/enums.dart';
// import 'package:provider/provider.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
