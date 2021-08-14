// // import 'package:coworking_space/category_wise_detail/category.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/cupertino.dart';
// // // 
// // import 'dart:js';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/category_wise_detail/category.dart';
// import 'package:flutter/cupertino.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:provider/provider.dart';

// // ignore: missing_return
// void getcategory(CategoryNotifier cat,BuildContext context) 
// {
// // CollectionReference catPlace = FirebaseFirestore.instance.collection('place_category');


//    FirebaseFirestore.instance
//     .collection('place_category')
//     .snapshots().map((document) {
//       print(document['name']);
//     }
//     );
//     // map((doc) {
//             // print(dociment["name"].toString());//print(doc["cat_type"]);print(doc["img"]);
//             // cat.addCategory(doc['name'].toString() ,doc['cat_type'], doc['img'].toString());            
//         // });
//     // });
// }
// // void getCategory(CategoryNotifier catnotifier) async {
// // //   // List<Category> _curcat = []; 
// // snapshot.data.documents.map((document)



// // Stream<QuerySnapshot>  catPlace = FirebaseFirestore.instance.collection('place_category').snapshots();



// // //   catPlace.map((event) {
// // //     if (event.docs.isEmpty) {
// // //           return Text('Something went wrong');
// // //         }
// // //         if (catPlace.connectionState == ConnectionState.waiting) {
// // //           return Text("Loading");
// // //         }
// // //   });

// //   // });  
// // }




// //   // await FirebaseFirestore.instance
// //   //     .collection('place_category')
// //   //     .get()
// //   //     .then((querySnapshot) {
// //   //    querySnapshot.docs.forEach((result) {
// //   //        if (snapshot.connectionState == ConnectionState.waiting) {
// //   //         return Text("Loading");
// //   //       }
// //       // Category cat;// = Category.fromMap(result.data());
// //       // cat.name=querySnapshot['name'];
// //       // Map<String, dynamic> data = result.data();
// //       // catnotifier.addCategory(data['id'],List.from(data['sub_type']),data['image']);
// //       // _curcat.add(cat);
// //     // });