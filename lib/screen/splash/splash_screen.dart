// import 'package:coworking_space/screen/splash/messaging_widget.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/screen/splash/components/body.dart';
import 'package:coworking_space/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    print("in splash screen?????????????????????");
    SizeConfig().init(context);
    return Scaffold(
      
      body: 
      // MessagingWidget(),
      Body(),
      
    );
  }
}
