// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/components/custom_surfix_icon.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path/path.dart' as Path;
// import '../../../constants.dart';
// import '../../../size_config.dart';

// class ProfileInfo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
//       floatingActionButton: SizedBox(
//         width: 90,
//         child: FloatingActionButton(
//           // splashColor: Colors.amber,
//           backgroundColor:  Colors.amber[800],
//           onPressed: () {},
//           child: Text("save"),
//           shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         ),
//       ),
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
//       body: Personalinfo(),
//     );
//   }
// }


// class Personalinfo extends StatefulWidget {
//   // const Personalinfo({ Key? key }) : super(key: key);

//   @override
//   _PersonalinfoState createState() => _PersonalinfoState();
// }

// class _PersonalinfoState extends State<Personalinfo> {
//   String firstname, lastname, email, phonenumber, address;

//     String user;
//   var _image;
//   var _img;

//   Future<void> getdata() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       user = prefs.getString('current_login_user');
// //   if(user.startsWith(new RegExp(r'-'))){
// // //     //new RegExp(r'[A-Z][a-z]')
// //      user=user.substring(1, user.length-1);
// // // print("?????????????????? -------------------------------user"+user);
// // //  }

// //     }
//     });

//     //print("??????????????????"+user);
//   }

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
//         _image = value.data['img'];
//       });
//     });
//   }

//   // ignore: non_constant_identifier_names
//   void open_gallery() async {
//     // ignore: deprecated_member_use
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _img = image;
//       // widget.onimageselects(_image);
//       // print("???????????????>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<");

//       print("path anme");
//       // print(Path.basename(_image.path));
//       print("_image ...............");
//       print(_image);
//       print("_image ..extra.............");
//       print(image);
//       // uploadFile();
//       // widget.onimageselects(_image);

//       // ignore: unused_element

//       //       String fileName = Path.basename(_imageFile.path);
//       // StorageReference firebaseStorageRef =
//       //     FirebaseStorage.instance.ref().child('uploads/$fileName');
//       // StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
//       // StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//       // taskSnapshot.ref.getDownloadURL().then(
//       //       (value) => print("Done: $value"),
//       //     );
//       print("?????????????????????<<<<<<<<<<<<>>>>>>>>>>>>>>>");
//     });
//   }

//   Future<void> storeimg() async {
//     StorageReference storageReference =
//         FirebaseStorage.instance.ref().child('${Path.basename(_img.path)}');
//     StorageUploadTask uploadTask = storageReference.putFile(_img);
//     await uploadTask.onComplete;
//     print('File Uploaded');
//     print("??????????????????>>>>>><<<<<<!@###########");
//     storageReference.getDownloadURL().then((value) {
//       print("????????????????????????....................");
//       print(value);
//       print("????????????????????????....................");
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
//     return SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//             child: 
//               Column(
//                 children: [
//                                  SizedBox(
//                   height: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                   child: Stack(
//                     children: <Widget>[
//                       CircleAvatar(
//                         backgroundColor: Colors.black,
//                         radius: 70,
//                         // child: ClipOval(child: Image.asset('images/image3.png', height: 150, width: 150, fit: BoxFit.cover,),),
//                         child: ClipOval(
//                             // child: Image.network(_image,height: 150,width: 150,fit: BoxFit.cover),
//                             child: (_img == null)
//                                 ? Image.network(_image,
//                                     width: 200, height: 150, fit: BoxFit.cover)
//                                 : Image.file(_img,
//                                     width: 200, height: 250, fit: BoxFit.cover)),
//                       ),
//                       Positioned(
//                           bottom: 2,
//                           right: 2,
//                           child: Container(
//                             height: 40,
//                             width: 40,
//                             child: GestureDetector(
//                               onTap: () {
//                                 open_gallery();
//                               },
//                               child: IconButton(
//                                   onPressed: () {
//                                     open_gallery();
//                                   },
//                                   icon: Icon(
//                                     Icons.add_a_photo,
//                                     color: Colors.black54,
//                                   )),
//                             ),
//                             decoration: BoxDecoration(
//                                 color: Colors.white60,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(20))),
//                           ))
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     // decoration: BoxDecoration(
//                     //   borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                     //   gradient: LinearGradient(
//                     //     begin: Alignment.topRight,
//                     //     end: Alignment.bottomLeft,
//                     //     colors: [Colors.white, Color.fromRGBO(0, 0,0, 0)]
//                     //   )
//                     // ),
//                     child: Column(
//                       children: <Widget>[
//                         // loggedInUser == null
//                         //     ? Text(
//                         //         "",
//                         //         style: TextStyle(
//                         //             fontSize: 25, fontWeight: FontWeight.w500),
//                         //       )
//                         //     : SizedBox(
//                         //         height: 15,
//                         //       ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             // autofocus: false,
//                             initialValue: firstname,
//                             keyboardType: TextInputType.text,
//                             onSaved: (value) {
//                               setState(() {
//                                 firstname = value;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 firstname = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                                 labelStyle: TextStyle(color: Colors.amber[800]),
//                                 labelText: "First Name",
//                                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                                 suffixIcon: CustomSurffixIcon(
//                                     svgIcon: "assets/icons/User.svg")),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             // autofocus: false,
//                             initialValue: lastname,
//                             keyboardType: TextInputType.text,
//                             onSaved: (value) {
//                               setState(() {
//                                 lastname = value;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 lastname = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                                 labelText: "Last Name",
//                                 labelStyle: TextStyle(color: Colors.amber[800]),
//                                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                                 suffixIcon: CustomSurffixIcon(
//                                     svgIcon: "assets/icons/User.svg")),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             // autofocus: false,
//                             initialValue: email,
//                             keyboardType: TextInputType.emailAddress,
//                             onSaved: (value) {
//                               setState(() {
//                                 email = value;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 email = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                                 labelText: "Email",
//                                 labelStyle: TextStyle(color: Colors.amber[800]),
//                                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                                 suffixIcon: CustomSurffixIcon(
//                                     svgIcon: "assets/icons/Mail.svg")),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             // autofocus: false,
//                             initialValue: address,
//                             keyboardType: TextInputType.text,
//                             onSaved: (value) {
//                               setState(() {
//                                 address = value;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 address = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                                 labelText: "Address",
//                                 labelStyle: TextStyle(color: Colors.amber[800]),
//                                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                                 suffixIcon: CustomSurffixIcon(
//                                     svgIcon: "assets/icons/Location point.svg")),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             // autofocus: false,
//                             initialValue: phonenumber,
//                             keyboardType: TextInputType.number,
//                             onSaved: (value) {
//                               setState(() {
//                                 phonenumber = value;
//                               });
//                             },
//                             onChanged: (value) {
//                               setState(() {
//                                 phonenumber = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                                 labelText: "Phone Number",
//                                 labelStyle: TextStyle(color: Colors.amber[800]),
//                                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                                 suffixIcon: CustomSurffixIcon(
//                                     svgIcon: "assets/icons/Phone.svg")),
//                           ),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//                 ]),
//             ),
//           )      
//       );          
//   }
// }