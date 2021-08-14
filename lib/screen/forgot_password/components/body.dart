// import 'dart:ffi';

// import 'package:coworking_space/components/custom_surfix_icon.dart';

import 'package:coworking_space/components/default_button.dart';
import 'package:coworking_space/components/form_error.dart';
import 'package:coworking_space/components/no_account_text.dart';

import 'package:coworking_space/screen/sign_in/sign_in_screen.dart';
// import 'package:coworking_space/constants.dart';
// import 'package:coworking_space/screen/login_success/login_success_screen.dart';
// import 'package:coworking_space/screen/sign_in/sign_in_screen.dart';
import 'package:coworking_space/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {

  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

  TextEditingController _registeredemail = new TextEditingController();
  // TextEditingController _newpasswordController = new TextEditingController();
  // TextEditingController _newconpasswordController = new TextEditingController();
  String email;
  String oldpassword;
  String newpassword;
  String newconpassword;
  // bool _obscureText = true;
  // ignore: unused_field
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    
        return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                    height: 50,
                ),
                 TextFormField(
                    autofocus: false,
                    // obscureText: _obscureText,
                    controller: _registeredemail,
                    // keyboardType: TextInputType.emailAddress,
                    // ignore: deprecated_member_use
                    // controller: passwordTextController,
                    onSaved: (value) => oldpassword = value,
              onChanged: (value) {
                // if (value.length == 0)
                //   return "Please old Enter password";
                // else if (value.length >= 12)
                //   return "old Password should be less then 12 char long";
                // else if (value.length <= 6)
                //   return "old Password should be more then 6 char long";
                // else
                    return null;
              },
              validator: (value) {
                // if (value.length == 0)
                //   return "Please Enter old password";
                // else if (value.length >= 12)
                //   return "old Password should be less then 12 char long";
                // else if (value.length <= 6)
                //   return "old Password should be more then 6 char long";
                // else
                    return null;
              },
              decoration: InputDecoration(
                labelText: "Registered Email",
                hintText: "Email",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        // _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      Icons.email 
                    ),
                ),
              ),
            ),
     
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Text(" Write your email we will send code there"),
            SizedBox(height: SizeConfig.screenHeight * 0.1),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                //   // Do what you want to do
                    // _registeredemal
                    FirebaseAuth auth = FirebaseAuth.instance;
                    print(_registeredemail.text);
                    print("???????????}}}}}}}}}}}}}}}}{{{{{{{{{{{{{{{|||||||||||\\\\\\\\\\\\\\\\");
                    auth.sendPasswordResetEmail(email:_registeredemail.text).then((value) async {  
                                   
                      Navigator.pushNamed(context,SignInScreen.routeName);
                    });
                      
                // }
                // changepassword();
                // showDialog<String>(
                //                 context: context,
                //                 builder: (BuildContext context) => AlertDialog(
                //                   title: const Text('Password Change Alert'),
                //                   content: const Text('Your password was successfully changed'),
                //                   actions: <Widget>[
                //                     TextButton(
                //                       onPressed: () =>
                //                           Navigator.pop(context, 'Cancel'),
                //                       child: const Text('Cancel'),
                //                     ),
                //                     TextButton(
                //                       onPressed: () => Navigator.pushNamed(
                //                           context,LoginSuccessScreen.routeName),
                //                       child: const Text('OK'),
                //                     ),
                //                   ],
                //                 ),
                //               );
                }
                else {
                    setState(() {
                      // validation error
                      _autoValidate = true;
                    });
                }
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            NoAccountText(),
          ],
      ),
    ),
                  ),
        );
  }
   
   
    // Future<void> updatePassword() async {
    //     // [START update_password]
    //     FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //     String newPassword = "SOME-SECURE-PASSWORD";

    //     user.updatePassword(newPassword)
    //             .addOnCompleteListener(new OnCompleteListener<Void>() {
    //                 @Override
    //                 public void onComplete(@NonNull Task<Void> task) {
    //                     if (task.isSuccessful()) {
    //                         Log.d(TAG, "User password updated.");
    //                     }
    //                 }
    //             });
    //     // [END update_password]
    // }
}
