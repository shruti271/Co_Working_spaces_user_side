// ----------true janu valu 
// // import 'package:coworking_space/components/default_button.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/constants.dart';
// // import 'package:coworking_space/screen/profile/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:coworking_space/constants.dart';

// class EditProfile extends StatefulWidget {
//   // const EditProfile({Key? key}) : super(key: key);

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   String firstname,lastname,email,phonenumber,address;
//   FirebaseUser loggedInUser;

//   // getUserData() async {
//   //   FirebaseUser userdata = await FirebaseAuth.instance.currentUser();
//   //   setState(() {
//   //     loggedInUser = userdata;
//   //     print(loggedInUser);
//   //   });
//   //   print(loggedInUser);
//   //   print(loggedInUser.email);
//   //   print(loggedInUser.uid);
//   //   // print(loggedInUser..firstname);
//   //   // ignore: unused_labe
//   // }
// String user ;
// Future<void> getdata() async {
//    final prefs = await SharedPreferences.getInstance();
//    setState(() {

//  user = prefs.getString('current_login_user');
// //   if(user.startsWith(new RegExp(r'-'))){
// // //     //new RegExp(r'[A-Z][a-z]')
// //      user=user.substring(1, user.length-1);
// // // print("?????????????????? -------------------------------user"+user);
// // //  }

// //     }
//    });
   
//  //print("??????????????????"+user);
// }
//   Future<void> _getUserName() async {
//     final prefs = await SharedPreferences.getInstance();
//     user = prefs.getString('current_login_user');

//     Firestore.instance
//         .collection('userdetails')
//         .document(prefs.getString('current_login_user'))
//         .get()
//         .then((value) {
//       setState(() {
//         firstname = value.data['firstname'].toString();
//         lastname = value.data['lastname'].toString();
//         email = value.data['email'].toString();
//         phonenumber = value.data['phone number'].toString();
//         address = value.data['address'].toString();
//       });
//     });
//   }

//   @override
//   void initState() {
//     getdata();
//     super.initState();
//     // getUserData();
//     _getUserName();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           " User Details",
//           style: TextStyle(
//               // fontSize: 20,
//               color: kPrimaryColor,
//               fontWeight: FontWeight.w500),
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             // color: Colors.orange,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             // Padding(
//             //   padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: <Widget>[
//             //       Container(height: 50, width: 50 ,child: Icon(Icons.arrow_back_ios, size: 24,color: Colors.black54,), decoration: BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.all(Radius.circular(10))),),
//             //       Text('Profiles details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//             //       Container(height: 24,width: 24)
//             //     ],
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
//             //   child: Stack(
//             //     // children: <Widget>[
//             //     //   CircleAvatar(
//             //     //     radius: 70,
//             //     //     child: ClipOval(child: Image.asset('images/girl.jpg', height: 150, width: 150, fit: BoxFit.cover,),),
//             //     //   ),
//             //     //   Positioned(bottom: 1, right: 1 ,child: Container(
//             //     //     height: 40, width: 40,
//             //     //     child: Icon(Icons.add_a_photo, color: Colors.white,),
//             //     //     decoration: BoxDecoration(
//             //     //       color: Colors.deepOrange,
//             //     //       borderRadius: BorderRadius.all(Radius.circular(20))
//             //     //     ),
//             //     //   ))
//             //     // ],
//             //   ),
//             // ),
//             Expanded(
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //   borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                 //   gradient: LinearGradient(
//                 //     begin: Alignment.topRight,
//                 //     end: Alignment.bottomLeft,
//                 //     colors: [Colors.white, Color.fromRGBO(0, 0,0, 0)]
//                 //   )
//                 // ),
//                 child: Column(
//                   children: <Widget>[
//                     // loggedInUser == null
//                     //     ? Text(
//                     //         "",
//                     //         style: TextStyle(
//                     //             fontSize: 25, fontWeight: FontWeight.w500),
//                     //       )
//                     //     : SizedBox(
//                     //         height: 15,
//                     //       ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
//                       child: Container(
//                         height: 60,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               // "Email : ${loggedInUser.email}"
                             
//                              firstname.toString(),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           //  labelText: "Password",
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border:
//                                 Border.all(width: 1.0, color: Colors.black)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                       child: Container(
//                         height: 60,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               // " Uid : ${loggedInUser.uid}",
//                               lastname.toString(),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border:
//                                 Border.all(width: 1.0, color: Colors.black)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                       child: Container(
//                         height: 60,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               email.toString(),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border:
//                                 Border.all(width: 1.0, color: Colors.black)),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                       child: Container(
//                         height: 60,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               phonenumber.toString(),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border:
//                                 Border.all(width: 1.0, color: Colors.black)),
//                       ),
//                     ),
//                      Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                       child: Container(
//                         height: 60,
//                         child: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               // "Email : ${loggedInUser.email}"
                             
//                              address.toString(),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           //  labelText: "Password",
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             border:
//                                 Border.all(width: 1.0, color: Colors.black)),
//                       ),
//                     ),
//                     // Expanded(
//                     //   child: Align(
//                     //     alignment: Alignment.bottomRight,
//                     //     child: Container( height: 70, width: 200,
//                     //       child: Align(child: Text('Save', style: TextStyle(color: Colors.white70, fontSize: 20),),),
//                     //       decoration: BoxDecoration(
//                     //         color: Colors.deepOrange,
//                     //         borderRadius: BorderRadius.only(topLeft: Radius.circular(30),)
//                     //       ),
//                     //     ),
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class EditProfilePage extends StatelessWidget {

// //   const EditProfilePage({Key key}) : super(key: key);
// //   //  final _firestore = Firestore.instance;
// //   //  FirebaseUser loggedInUser;

// //   //  final FirebaseUser user;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: Icon(
// //             Icons.arrow_back,
// //             // color: Colors.orange,
// //             color: kPrimaryColor,
// //           ),
// //           onPressed: () {
// //                Navigator.of(context).pop();
// //           },
// //         ),
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.only(left: 16, top: 25, right: 16),
// //         child: GestureDetector(
// //           onTap: () {
// //             FocusScope.of(context).unfocus();
// //           },
// //           child: ListView(
// //             children: [
// //               Text(
// //                 "Edit Profile",
// //                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
// //               ),
// //               SizedBox(
// //                 height: 15,
// //               ),
// //               // Center(
// //               //   child: Stack(
// //               //     children: [
// //               //       // Container(
// //               //       //   width: 130,
// //               //       //   height: 130,
// //               //       //   decoration: BoxDecoration(
// //               //       //       border: Border.all(
// //               //       //           width: 4,
// //               //       //           color: Theme.of(context).scaffoldBackgroundColor),
// //               //       //       boxShadow: [
// //               //       //         BoxShadow(
// //               //       //             spreadRadius: 2,
// //               //       //             blurRadius: 10,
// //               //       //             color: Colors.black.withOpacity(0.1),
// //               //       //             offset: Offset(0, 10))
// //               //       //       ],
// //               //       //       shape: BoxShape.circle,
// //               //       //       image: DecorationImage(
// //               //       //           fit: BoxFit.cover,
// //               //       //           image: NetworkImage(
// //               //       //             "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
// //               //       //           ))),
// //               //       // ),
// //               //       Positioned(
// //               //           bottom: 0,
// //               //           right: 0,
// //               //           child: Container(
// //               //             height: 40,
// //               //             width: 40,
// //               //             decoration: BoxDecoration(
// //               //               shape: BoxShape.circle,
// //               //               border: Border.all(
// //               //                 width: 4,
// //               //                 color: Theme.of(context).scaffoldBackgroundColor,
// //               //               ),
// //               //               color: Colors.green,
// //               //             ),
// //               //             child: Icon(
// //               //               Icons.edit,
// //               //               color: Colors.white,
// //               //             ),
// //               //           )),
// //               //     ],
// //               //   ),
// //               // ),
// //               SizedBox(
// //                 height: 35,
// //               ),
// //               buildTextField("Full Name", "Janvi", false),
// //               buildTextField("E-mail", "janvi@gmail.com", false),
// //               buildTextField("Password", "********", true),
// //               buildTextField("Location", "b, c", false),
// //               SizedBox(
// //                 height: 35,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   // ignore: deprecated_member_
// //                   // ignore: deprecated_member_use
// //                   OutlineButton(
// //                     padding: EdgeInsets.symmetric(horizontal: 50),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20)),
// //                     onPressed: () {
// //                       Navigator.push(
// //                             context,
// //                             MaterialPageRoute(builder: (context) => ProfileScreen()),
// //                   );
// //                     },
// //                     child: Text("CANCEL",
// //                         style: TextStyle(
// //                             fontSize: 14,
// //                             letterSpacing: 2.2,
// //                             color: Colors.black)),
// //                   ),
// //                   // ignore: deprecated_member_use
// //                   RaisedButton(
// //                     onPressed: () {
// //                        Navigator.push(
// //                             context,
// //                             MaterialPageRoute(builder: (context) => ProfileScreen()),
// //                   );
// //                     },
// //                    color: kPrimaryColor,
// //                     padding: EdgeInsets.symmetric(horizontal: 50),
// //                     elevation: 2,
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20)),
// //                     child: Text(
// //                       "SAVE",
// //                       style: TextStyle(
// //                           fontSize: 14,
// //                           letterSpacing: 2.2,
// //                           color: Colors.white),
// //                     ),
// //                   )
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildTextField(
// //       String labelText, String placeholder, bool isPasswordTextField) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 35.0),
// //       child: TextField(
// //         // obscureText: isPasswordTextField ? showPassword : false,
// //         decoration: InputDecoration(
// //             suffixIcon: isPasswordTextField
// //                 ? IconButton(
// //                     onPressed: () {
// //                       // setState(() {
// //                       //   showPassword = !showPassword;
// //                       // });
// //                     },
// //                     icon: Icon(
// //                       Icons.remove_red_eye,
// //                       color: Colors.grey,
// //                     ),
// //                   )
// //                 : null,
// //             contentPadding: EdgeInsets.only(bottom: 3),
// //             labelText: labelText,
// //             floatingLabelBehavior: FloatingLabelBehavior.always,
// //             hintText: placeholder,
// //             hintStyle: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.black,
// //             )),
// //       ),
// //     );
// //   }
// // }
