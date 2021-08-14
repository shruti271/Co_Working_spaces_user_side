// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/google_map/all_place_ingoogle_map_marker.dart';
import 'package:coworking_space/size_config.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// import '../constants.dart';
// import 'package:geolocator/geolocator.dart';

// import 'all_place_ingoogle_map_marker.dart';

class Allmapbody extends StatefulWidget {
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  static String routeName = "/allmaplocation";
  @override
  _AllmapbodyState createState() => _AllmapbodyState();
}

class _AllmapbodyState extends State<Allmapbody> {
  

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String catId=arguments['catId'];
// double  distanceInMeters = await Geolocator().distanceBetween(latt, longg,lat2,long2);z
    return 
      Scaffold(
        appBar: AppBar(title: Text("all location"),),
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight * 0.95,
          width: SizeConfig.screenWidth * 0.95,
          child: 
          GoogleLocationall(catId: catId),
          ),
      ),
      );
    
  }
}

