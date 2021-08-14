// necessary for shruti
// import 'package:coworking_space/favourte_main_page.dart/body.dart';
// import 'package:coworking_space/help/body.dart';
import 'package:coworking_space/favourte_main_page.dart/body.dart';
import 'package:coworking_space/screen/profile/help_screen/help_screen.dart';
// import 'package:coworking_space/screen/profile/chatscreen.dart';
// import 'package:coworking_space/screen/profile/help_screen/help_screen.dart';
// import 'package:coworking_space/screen/profile/msgscreen.dart';
import 'package:coworking_space/screen/profile/profile_screen.dart';
import 'package:coworking_space/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                 color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),
                onPressed: () {
                  Navigator.pushNamed(context, MainpageOfFavourite.routeName);                  
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,),
                onPressed: () {                                    
                  // Navigator.pushNamed(context, ChatDetailPage.routeName);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpScreen()),
                  );
                  //  Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatScreen()),
                  // );
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            ],
          )),
    );
  }
}
