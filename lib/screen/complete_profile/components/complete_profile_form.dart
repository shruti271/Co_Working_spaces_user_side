// import 'package:flutter/material.dart';
// import 'package:coworking_space/components/custom_surfix_icon.dart';
// // import 'package:coworking_space/components/default_button.dart';
// import 'package:coworking_space/components/form_error.dart';
// import 'package:coworking_space/screens/login_success/login_success_screen.dart';
// // import 'package:shop_app/screens/otp/otp_screen.dart';

// import '../../../constants.dart';
// import '../../../size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// final _firestore = Firestore.instance;
// FirebaseUser loggedInUser;

// class CompleteProfileForm extends StatefulWidget {
//   @override
//   _CompleteProfileFormState createState() => _CompleteProfileFormState();
// }

// class _CompleteProfileFormState extends State<CompleteProfileForm> {
//   final firstnameTextController=TextEditingController();
//   final lastnameTextController=TextEditingController();
//   final phonenumberTextController=TextEditingController();
//   final addressTextController=TextEditingController();

  
//   final _auth = FirebaseAuth.instance;

//   final _formKey = GlobalKey<FormState>();
//   final List<String> errors = [];
//   String firstName;
//   String lastName;
//   String phoneNumber;
//   String address;

//   void addError({String error}) {
//     if (!errors.contains(error))
//       setState(() {
//         errors.add(error);
//       });
//   }

//   void removeError({String error}) {
//     if (errors.contains(error))
//       setState(() {
//         errors.remove(error);
//       });
//   }

//   @override
//    void initState() {
//     super.initState();

//     getCurrentUser();
//   }

//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser();
//       if (user != null) {
//         loggedInUser = user;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           buildFirstNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildLastNameFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildPhoneNumberFormField(),
//           SizedBox(height: getProportionateScreenHeight(30)),
//           buildAddressFormField(),
//           FormError(errors: errors),
//           SizedBox(height: getProportionateScreenHeight(40)),
//           // DefaultButton(
//           //   text: "continue",
//           //   press: () {
//           //     if (_formKey.currentState.validate()) {
//           //       // Navigator.pushNamed(context, OtpScreen.routeName);
//           //       Navigator.pushNamed(context,LoginSuccessScreen.routeName);
//           //     }
//           //   },
//           // ),
//           // ignore: deprecated_member_use
//           FlatButton(
//                     onPressed: () {
//                       // messageTextController.clear();
//                       _firestore.collection('userdetails').add({
//                         'firstname':firstName,
//                         'lastname':lastName,
//                         'phone number':phoneNumber,
//                         'address':address,
//                         // 'sender': loggedInUser.email,
//                       });
//                       Navigator.pushNamed(context,LoginSuccessScreen.routeName);
//                     },
//                     child: Text(
//                       'Send',
//                       // style: kSendButtonTextStyle,
//                     ),
                  
//                   ),
//         ],
//       ),
//     );
//   }

//   TextFormField buildAddressFormField() {
//     return TextFormField(
//       // onSaved: (newValue) => address = newValue,
//       onChanged: (value) {
//         // if (value.isNotEmpty) {
//         //   removeError(error: kAddressNullError);
//         // }
//         // return null;
//         address=value;
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kAddressNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Address",
//         hintText: "Enter your phone address",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon:
//             CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
//       ),
//     );
//   }

//   TextFormField buildPhoneNumberFormField() {
//     return TextFormField(
//       keyboardType: TextInputType.phone,
//       onSaved: (newValue) => phoneNumber = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kPhoneNumberNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kPhoneNumberNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Phone Number",
//         hintText: "Enter your phone number",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
//       ),
//     );
//   }

//   TextFormField buildLastNameFormField() {
//     return TextFormField(
//       onSaved: (newValue) => lastName = newValue,
//       decoration: InputDecoration(
//         labelText: "Last Name",
//         hintText: "Enter your last name",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }

//   TextFormField buildFirstNameFormField() {
//     return TextFormField(
//       onSaved: (newValue) => firstName = newValue,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kNamelNullError);
//         }
//         return null;
//       },
//       validator: (value) {
//         if (value.isEmpty) {
//           addError(error: kNamelNullError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "First Name",
//         hintText: "Enter your first name",
//         // If  you are using latest version of flutter then lable text and hint text shown like this
//         // if you r using flutter less then 1.20.* then maybe this is not working properly
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
//       ),
//     );
//   }
// }
