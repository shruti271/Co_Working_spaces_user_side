// import 'package:coworking_space/screen/home/components/home_page_category.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../nearby_places_from_cowork.dart';

// ignore: must_be_immutable
// class Nearbyplacelocation extends StatelessWidget {
//   LatLng ltn=LatLng(21.2060, 72.8866);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: getProducts(getNearbyStores(ltn)),
//         builder: (context,snapshot){
//             return ListView.builder(
//               itemCount: 2,
//               itemBuilder: (context,index){
//               return SpecialOfferCard(category: "category", image: null, numOfBrands: 12, press: null);
//             });
//       }),
//     );
//   }
// }


// // ignore: must_be_immutable
// class Nearbyplacelocation extends StatelessWidget {
//   LatLng ltn=LatLng(21.2060, 72.8866);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       child: StreamBuilder(
//         stream: getNearbyStores(ltn),
//         builder: (context,snapshot){
//             return ListView.builder(
//           // itemCount:snapshot.toString().length.toInt(),
//               itemCount: 1,
//               itemBuilder:(context,index){
//               return Container(
//                 child: Text(snapshot.data[index]['spacename']),
//               );
//             });
//       }),
//     );
//   }
// }


// ignore: must_be_immutable
class Nearbyplacelocation extends StatelessWidget {
  LatLng ltn=LatLng(21.2081724, 72.8826179);
  
  @override
  Widget build(BuildContext context) {
    getNearbyStores(ltn);
    return Container(
      height: 300,
      child: Text("hello"),
      // child: FutureBuilder(
      //   future: getNearbyStores(ltn),
      //   builder: (context,snapshot){
      //     if(snapshot.hasData)
      //     print("yes????????????????????????????????????????${snapshot[0].data['spacename']}");
      //     else
      //     print("no????????????????????????????????????????${snapshot.data.toString().length}");
      //       return ListView.builder(
      //     // itemCount:snapshot.toString().length.toInt(),
      //         itemCount: 1,
      //         itemBuilder:(context,index){
      //         return Container(
      //           child: Text(snapshot.data[index]['spacename']),
      //         );
      //       });
      // }),
    );
  }
}
