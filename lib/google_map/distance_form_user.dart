// // import 'dart:ffi';
// // import 'dart:js';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:coworking_space/google_map/practice.dart';
// import 'package:flutter/material.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';
// import 'package:geolocator/geolocator.dart';
// // import 'package:permission_handler/permission_handler.dart';

 

// Future<Position> getuserscurrentlocation() async {
  
//   Position pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {return value;});
//   print(pos);
//   print("++++++++++++++++++++++++++");
//   return pos;

// }
// // distance between 2 point

//  Future<double> getdistance(double lat,double lon,double destlat,double destlon) async {

//     double  distanceInMeters = await Geolocator().distanceBetween(lat,lon,destlat,destlon).then((value) => value);
//     print("---------++++++++ohk++++++++--------");
//     print(distanceInMeters/1000);
//     print("--------++++++++ohk+++++++++---------");
//   return (distanceInMeters/1000);

//   }

// // ignore: missing_return
// Future<double> finalcalc(double lat,double lon) async{

//   double _disvar;

//   Future.delayed(
//       Duration(seconds: 4),
//       () async{
//         Position pos= await getuserscurrentlocation();
  
//    _disvar= await Future.value(await getdistance(pos.latitude,pos.longitude,lat,lon));
//       });
//       return _disvar; 
//   // return distancefromme;
// }
// // near by space
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

void getme(double lat,double lon){
     final geo = Geoflutterfire();
    GeoFirePoint center = geo.point(latitude: lat, longitude: lon);
    print(center);

// get the collection reference or query
var collectionReference = Firestore.instance.collection("places");
double radius = 500;
String field = 'location';

Stream<List<DocumentSnapshot>> stream = geo.collection(collectionRef: 
       collectionReference).within(center: center, radius: radius, field: field);
      //  print(List.from(stream).length);
 stream.listen((List<DocumentSnapshot> documentList) {
  //  print("-------------]]]]..................");
   print(List.from(documentList).length);
   print(documentList);
  //  print("-------------]]]]..................");
 });
  }

// // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//   class Distanceinkm extends StatefulWidget {    
//     Distanceinkm({@required this.lat,@required this.lon});
//     final double lat;
//     final double lon;
//   @override
//   _DistanceinkmState createState() => _DistanceinkmState(lat,lon);
// }

// class _DistanceinkmState extends State<Distanceinkm> {

// _DistanceinkmState(double lat,double lon);

//  double _distancefromme;
// // double disinkm;
// // ----------------

// Future<Position> getuserscurrentlocation() async {
  
//   Position pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   print(pos);
//   print("++++++++++++++++++++++++++");
//   return pos;

// }

// // distance between 2 point

//  Future<double> getdistance(double lat,double lon,double destlat,double destlon) async {

//     double  distanceInMeters = await Geolocator().distanceBetween(lat,lon,destlat,destlon);
//     print("---------++++++++ohk++++++++--------");
//     print(distanceInMeters/1000);
//     print("--------++++++++ohk+++++++++---------");
//   return (distanceInMeters/1000);

//   }


// Future<double> finalcalc(double lat,double lon) async{
//   Position pos= await getuserscurrentlocation();
//   // ignore: unnecessary_statements
//   Future.delayed(
//     Duration(seconds: 4),() async{
//     _distancefromme=await  getdistance(pos.latitude,pos.longitude,lat,lon);
//   });
//   return _distancefromme;  
// }
// // ----------------

//   @override
//   void initState() { 
//     super.initState();    
    
//     setState(() {
//           // finalcalc(widget.lat,widget.lon);
//           _distancefromme=  finalcalc(widget.lat,widget.lon) as double;
//         });
        
//     //  finalcalc(widget.lat,widget.lon);
//   }
//   // _distancefromme= finalcalc(widget.lat,widget.lon);
//     @override
//     Widget build(BuildContext context) {
//       setState(() {
//           finalcalc(widget.lat,widget.lon);
//         });
//       return  Text("$_distancefromme");
//       // double.parse((distancefromme).toStringAsFixed(2))
      
//     }
// }

// // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// // ignore: must_be_immutable
// class Disfromuser extends StatelessWidget {
//   Disfromuser({@required this.lat,@required this.lon});
//     final double lat;
//     final double lon;
//     double _dist;

// void initState() async{   
//     _dist= await  finalcalc(lat,lon).then((value) => value);  
// }
//   @override
//   Widget build(BuildContext context) {
    
   
      

   
//     return ;
//     // FutureBuilder<double>(
//     //   future: finalcalc(lat,lon),
//     //   builder: //(context, AsyncSnapshot<String> snapshot) {
//     //     // if (snapshot.hasData) {
//     //       return Text("");
//     //     // } 
//     //   // }
//     // );
//   }
// }