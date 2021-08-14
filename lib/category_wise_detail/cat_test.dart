// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Catmy extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//         CollectionReference users = FirebaseFirestore.instance.collection('place_category');
//     return StreamBuilder<QuerySnapshot>(
//       stream: users.snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//         return  Container(          
//           child: ListView(
//             children: snapshot.data.docs.map((DocumentSnapshot document) {
//               return new ListTile(              
//                 subtitle: new Text(document.data()['name']),
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }


// // void getc(){
// //         CollectionReference users = FirebaseFirestore.instance.collection('place_category');

// // }