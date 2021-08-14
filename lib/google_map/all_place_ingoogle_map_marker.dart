import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
 String catId;
// String catId;
  // Future<List<QueryDocumentSnapshot>> dot= FirebaseFirestore.instance
  //                         .collection('places')
  //                         .where('category_id', isEqualTo: catId )
  //                         .where('placeofcity', isEqualTo: selectedLocation).get().then((value){
  //                            return value.docs;
  //                            });

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}

class GoogleLocationall extends StatefulWidget {
  GoogleLocationall({Key key,@required this.catId}): super(key: key);
final String catId;
  @override
  _GoogleLocationallState createState() => _GoogleLocationallState(catId:catId);
}

class _GoogleLocationallState extends State<GoogleLocationall> {
  
  String catId;
  _GoogleLocationallState({this.catId});

  Completer<GoogleMapController> _controller = Completer();

  String getcatid(){return catId;}
 
                      //  String stl= dot['spacename'];


  // ignore: unused_field
  static LatLng center ;

  // LatLng _lastMapPosition ;//= _center;

  MapType _currentMapType = MapType.normal;

  final Set<Marker> _markers = {};

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

LatLng getcenter()  {
  LatLng latLng;
  //  FirebaseFirestore.instance
  //                         .collection('places')
  //                         .where('category_id', isEqualTo: catId)
  //                         .where('placeofcity', isEqualTo: selectedLocation).limit(1).get().then((element) {
  //                           GeoPoint geo= element.docs[0]['location'];
  //                           latLng=LatLng(geo.latitude,geo.longitude);
  //                           print("=========================------------------++++++++++++++))))))))))))))))))))))");
  //                           print(latLng);
  //                           print("=========================------------------++++++++++++++))))))))))))))))))))))");
  //                         });
  //                         // return latLng;
  //                         center=latLng;
  //                         _lastMapPosition=center;
                          return latLng;
                          // return 0;
}

  void _onAddMarkerButtonPressed() {
    //  setState(() {
    
       Firestore.instance
                          .collection('places')
                          .where('category_id', isEqualTo: catId)
                          .where('placeofcity', isEqualTo: selectedLocation)
                          .getDocuments().then((querySnapshot) async{
                            // GeoPoint geo= value.docs['location'].data();
                             querySnapshot.documents.forEach((element) {
                              GeoPoint geo= element['location'];
                              LatLng latLng=LatLng(geo.latitude,geo.longitude);
                              // center=latLng;
                              // _lastMapPosition=center;
                              setState(() {
                              _markers.add(
                                  Marker(                                  
                                  markerId: MarkerId(latLng.toString()),
                                  position: latLng,
                                  infoWindow: InfoWindow(
                                    title: '${element['spacename']}',
                                    snippet: '${element['address']}',
                                  ),
                                  icon: BitmapDescriptor.defaultMarker,
                                )
                                );
                                });
                            });
                          });
                    // });//setstate finish
    // return _markers;                    
    
  }

  void _onCameraMove(CameraPosition position) {
    // _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

@override
void initState() { 
  // _onAddMarkerButtonPressed();
    // getcenter();
    // LatLng latLng;
    // FirebaseFirestore.instance
    //                       .collection('places')
    //                       .where('category_id', isEqualTo: catId)
    //                       .where('placeofcity', isEqualTo: selectedLocation).limit(1).get().then((element) {
    //                         GeoPoint geo= element.docs[0]['location'];
    //                         latLng=LatLng(geo.latitude,geo.longitude);
    //                         print("=========================------------------++++++++++++++))))))))))))))))))))))");
    //                         print(latLng);
    //                         print("=========================------------------++++++++++++++))))))))))))))))))))))");
    //                       });
    //                       // return latLng;
    //                       center=latLng;
                          // _lastMapPosition=center;
    // _lastMapPosition=center;
    _onAddMarkerButtonPressed();
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
    print("clicked");
    _onAddMarkerButtonPressed();
    return SizedBox(
      // width: 100, // or use fixed size like 200      
      height: 400,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            gestureRecognizers: < Factory<OneSequenceGestureRecognizer> >[
              Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer()
                  )
                  ].toSet(),
            initialCameraPosition: CameraPosition(
              // target:LatLng(21.2060, 72.8866),
              target:LatLng(19.7515,75.7139),
              zoom: 4,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0),
                    heroTag: 'tag1',
                  ),
                  // SizedBox(height: 16.0),
                  // FloatingActionButton(
                  //   onPressed: _onAddMarkerButtonPressed,
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.green,
                  //   child: const Icon(Icons.add_location, size: 36.0),
                  //   heroTag: 'tag2',
                  // ),
                  // SizedBox(height: 16.0),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     MapUtils.openMap(center.latitude, center.longitude);
                  //     // launchMap();
                  //   },
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.green,
                  //   child: const Icon(Icons.location_on, size: 36.0),
                  //   heroTag: 'tag3',
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
