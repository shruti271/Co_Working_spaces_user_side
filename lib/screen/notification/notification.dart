import 'package:coworking_space/constants.dart';
import 'package:coworking_space/screen/splash/messaging_widget.dart';
import 'package:flutter/material.dart';

class NsScreen extends StatelessWidget {
  // static String routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: MessagingWidget(),
       );
  }
}
