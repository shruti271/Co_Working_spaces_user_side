// import 'package:coworking_space/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        // title: Text("Login Success"  , style: TextStyle( color:kPrimaryColor),),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Body(),
      ),
    );
  }
}
