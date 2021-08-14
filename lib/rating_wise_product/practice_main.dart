// // import 'dart:html';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/size_config.dart';
// import 'package:flutter/material.dart';

// import 'main_rating_wise_pro.dart';

// class HomePageRatingView extends StatefulWidget {
//   @override
//   _HomePageRatingViewState createState() => _HomePageRatingViewState();
// }

// class _HomePageRatingViewState extends State<HomePageRatingView> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "High Rated",
//           style: TextStyle(fontSize: 20, color: Colors.black),
//         ),
//         Container(
//           // child: Text("hello"),
//           height: 300,
//           // width: double.infinity,
//           // child: FutureBuilder(
//           //     future: FirebaseFirestore.instance
//           //         .collection('places')
//           //         .orderBy("rating")
//           //         .limit(4)
//           //         .get(),
//           //     builder: (context, snapshot) {
//           //       if (snapshot.hasData) Text("waiting");
//           //       if (snapshot.hasError) Text("waiting error");
//                 // return
//                  child:ListView.builder(
//                   //  scrollDirection: Axis.horizontal,
//                   itemCount: 2,
//                   itemBuilder: (context, index) {
//                   // return Myratingcard(cdata: snapshot.data.docs[index]);
//                   return Myratingcard();
//                   // 
//                 // });
//               // }),
//                   })
//         )
//       ],
//     );
//   }
// }
