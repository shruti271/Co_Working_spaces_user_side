// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:geoflutterfire/geoflutterfire.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'dart:html';

// // import 'dart:html';

// // import 'package:coworking_space/permision_check.dart';
// // import 'package:android_intent/android_intent.dart';
// // import 'dart:html';

// import 'package:flutter/material.dart';
// // import 'package:coworking_space/category_wise_detail/car.dart';
// // import 'package:coworking_space/screen/home/home_screen.dart';
// // import 'package:coworking_space/routes.dart';
// // import 'package:coworking_space/theme.dart';
// // import 'package:provider/provider.dart';
// // import 'category_wise_detail/category.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:geolocator/geolocator.dart';

// Position position;
// Future<Position> getpos() async {
//   Position pos = await Geolocator()
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   print(pos);
//   print("++++++++++++++++++++++++++");
//   return pos;
// }

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("heloo"),
//         ),
//         body: Demomy(),
//       ),
//     );
//   }
// }

// class Demomy extends StatefulWidget {
//   @override
//   _DemomyState createState() => _DemomyState();
// }

// class _DemomyState extends State<Demomy> {
//   @override
//   void initState() {
//     super.initState();
//     // getpos();
//   }

//   Future<void> getdis(double lat,double lon) async {
// // ignore: unused_local_variable
// double  distanceInMeters = await Geolocator().distanceBetween(lat,lon,21.2306,72.9015);
// print("---------++++++++ohk++++++++--------");
// print(distanceInMeters/1000);
// print("--------++++++++ohk+++++++++---------");

//   }

//   void getme(double lat,double lon){
//      final geo = Geoflutterfire();
//     GeoFirePoint center = geo.point(latitude: lat, longitude: lon);
//     print(center);

// // get the collection reference or query
// var collectionReference = FirebaseFirestore.instance.collection("places");
// double radius = 500;
// String field = 'location';

// Stream<List<DocumentSnapshot>> stream = geo.collection(collectionRef: 
//        collectionReference).within(center: center, radius: radius, field: field);
//       //  print(List.from(stream).length);
      
//  stream.listen((List<DocumentSnapshot> documentList) {
//    print("-------------]]]]..................");
//    print(List.from(documentList).length);
//    print(documentList);
//    print("-------------]]]]..................");
//  });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // ignore: deprecated_member_use
//       child: FlatButton(
//           color: Colors.blue,
//           onPressed: () async {
            
            
//           },
//           child: Text(
//             "get location",
//           )),
//     );
//   }
// }
