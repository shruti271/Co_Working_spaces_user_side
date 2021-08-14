import 'package:coworking_space/constants.dart';
import 'package:coworking_space/screen/profile/help_screen/bookingscreen.dart';
import 'package:coworking_space/screen/profile/help_screen/general_screen.dart';
import 'package:coworking_space/screen/profile/help_screen/paymentscreen.dart';
import 'package:coworking_space/screen/profile/help_screen/pricing_screen.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
import 'package:coworking_space/enums.dart';

// import 'components/body.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = "/helpscreen";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.dark,
            title: Text(
              "Help",
              style: TextStyle( color:kPrimaryColor),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "General",
                    style: TextStyle(
                        fontFamily: "BarlowBold", color: Colors.deepOrange,fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Pricing",
                    style: TextStyle(
                        fontFamily: "BarlowBold", color: Colors.deepOrange,fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Booking",
                    style: TextStyle(
                        fontFamily: "BarlowBold", color: Colors.deepOrange,fontWeight: FontWeight.w900),
                  ),
                ),
                Tab(
                  child: Text(
                    "Payment",
                    style: TextStyle(
                        fontFamily: "BarlowBold", color: Colors.deepOrange,fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          
          body: TabBarView(
            children: [
              GeneralScreen(),  
              PricingScreen(), 
              BookingScreen(),
              PaymentScreen(),
             
            ],
          ),
          bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.message),
        ));
  }
}

