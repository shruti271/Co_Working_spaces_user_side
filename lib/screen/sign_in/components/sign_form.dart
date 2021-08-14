import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/components/default_button.dart';
// import 'package:coworking_space/constants.dart';
import 'package:coworking_space/screen/login_success/login_success_screen.dart';
// import 'package:coworking_space/screen/sign_in/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/components/custom_surfix_icon.dart';
import 'package:coworking_space/components/form_error.dart';
// import 'package:coworking_space/screen/sign_in/auth_service.dart';
// import 'package:coworking_space/helper/keyboard.dart';
import 'package:coworking_space/screen/forgot_password/forgot_password_screen.dart';
// import 'package:coworking_space/screen/login_success/login_success_screen.dart';

// import '../../../components/default_button.dart';
// import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //  final AuthenticationService _auth = AuthenticationService();
  //   ----- this is for new second login
  String email;
  String password;
  bool _obscureText = true;
  bool _autoValidate = false;
  // bool remember = false;
  // final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  // ignore: unused_field
  final _auth = FirebaseAuth.instance;//--- this is for first login

  // String emaill;
  // String passwordd;
  final List<String> errors = [];
   String err="";

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // ignore: deprecated_member_use
      autovalidate: _autoValidate,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onSaved: (value) => email = value,
            onChanged: (String value) {
              if (value.length == 0)
                return "Please Enter Email";
              else if (!value.contains("@"))
                return "Please Enter valid Email";
              else
                return null;
            },
            validator: (String value) {
              if (value.length == 0)
                return "Please Enter Email";
              else if (!value.contains("@"))
                return "Please Enter valid Email";
              else
                return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            // ignore: deprecated_member_use
            controller: _passwordController,
            onSaved: (value) => password = value,

            onChanged: (value) {
              // if (value.length == 0)
              //   return "Please Enter password";
              // else if (value.length >= 12)
              //   return "Password should be less then 12 char long";
              // else if (value.length <= 6)
              //   return "Password should be more then 6 char long";
              // else
                return null;
            },
            validator: (value) {
              // if (value.length == 0)
              //   return "Please Enter password";
              // else if (value.length >= 12)
              //   return "Password should be less then 12 char long";
              // else if (value.length <= 6)
              //   return "Password should be more then 6 char long";
              // else
                return null;
            },
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Center(child: Text(err,style: TextStyle(color: Colors.red),),),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              // Checkbox(
              //   value: remember,
              //   activeColor: kPrimaryColor,
              //   onChanged: (value) {
              //     setState(() {
              //       remember = value;
              //     });
              //   },
              // ),
              // Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              // --- new email sign in
              //   if (_formKey.currentState.validate()) {
              //     signInUser();
              // }

// ----------------------------------------------------------------------------------
//sign in 1 login sucess
              if (_formKey.currentState.validate()) {
                print("Email $email");
                print("Password $password");
                try {
                  //     Firestore.instance.collection('userdetails').where('email',isEqualTo: _emailController.text).where('password',isEqualTo: _passwordController.text).getDocuments().then((element) async {
                  //   // value.documents;
                  //   // setState(() {
                  //   //   usercheck="find";
                  //   // });
                  //   print("?????????????????????????????//////////////////////");
                  //   for (int i = 0; i < element.documents.length; i++) {
                  //     // var myd = (element.documents[i]['mydate'].toDate());
                  //     element.documents[i].documentID;
                  //     final prefs = await SharedPreferences.getInstance();
                  //     prefs.setString('current_login_user', element.documents[i].documentID);
                  //     prefs.setString('current_login_user_email', element.documents[i]['email']);
                  //     prefs.setString('current_login_user_phonenumber', element.documents[i]['phone number']);
                  //     prefs.setString('current_login_user_name', element.documents[i]['firstname']+" "+element.documents[i]['lastname']);

                  //     print("user_id" + element.documents[i].documentID);                      
                  //     print("???????????????????/////////////////////");
                
                  //   }
                  //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  // });
                  final user = await _auth.signInWithEmailAndPassword(
                      email: _emailController.text, password: _passwordController.text );
// Future<FirebaseUser> _user = FirebaseAuth.instance.currentUser();
// FirebaseAuth auth = FirebaseAuth.instance;

//                       auth.sendPasswordResetEmail(email: "shrutiitaliya6@gmail.com").then((value) {
//                         // print();
//                         print("//?????????????????????????????????????");
//                       });
                    
                  if (user != null) {
                    // FirebaseUser val =await _auth.currentUser();
                    // print(val.uid);
                    print("======================== ??????????????????????????????/++++++++++++++++++found");
                    //--------------
                    Firestore.instance.collection('userdetails').where('email',isEqualTo: _emailController.text).//where('password',isEqualTo: _passwordController.text).
                    getDocuments().then((element) async {
                  //   // value.documents;
                  //   // setState(() {
                  //   //   usercheck="find";
                  //   // });
                  //   print("?????????????????????????????//////////////////////");
                    for (int i = 0; i < element.documents.length; i++) {
                      // var myd = (element.documents[i]['mydate'].toDate());
                      element.documents[i].documentID;
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('current_login_user', element.documents[i].documentID);
                      prefs.setString('current_login_user_email', element.documents[i]['email']);
                      prefs.setString('current_login_user_phonenumber', element.documents[i]['phone number']);
                      prefs.setString('current_login_user_name', element.documents[i]['firstname']+" "+element.documents[i]['lastname']);

                      print("user_id" + element.documents[i].documentID);                      
                      print("???????????????????/////////////////////");
                
                    }
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  });
                  //--------------------------------------
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => LoginSuccessScreen()));

                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                } catch (e) {
                  print(e);
                  setState(() {
                      err="Invalid Email Or Password";
                    });
                }
              }
              else {
                  setState(() {
                    // validation error
                    _autoValidate = true;
                  });
                }
            },
          ),
        ],
      ),
    );
  }
   // ---- new login function 
  //   void signInUser() async {
  //   dynamic authResult =
  //       await _auth.loginUser(_emailController.text, _passwordController.text);
  //   if (authResult == null) {
  //     print('Sign in error. could not be able to login');
  //   } else {
  //     _emailController.clear();
  //     _passwordController.clear();
  //     Navigator.pushNamed(context, LoginSuccessScreen.routeName); 
  //   }
  // }
}
