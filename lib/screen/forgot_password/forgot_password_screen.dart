import 'package:coworking_space/constants.dart';
import 'package:flutter/material.dart';
// import 'package:coworking_space/screens/forgot_password/components/PhoneVerification.dart';
import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Forget Password" , style: TextStyle( color:kPrimaryColor),),
      ),
      body: ForgotPassForm(),
    );
  }
}

/*
 final user = await _auth.signInWithEmailAndPassword(
                  //     email: _emailController.text, password: _passwordController.text );
                  // if (user != null) {
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginSuccessScreen()),

                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  // }*/
