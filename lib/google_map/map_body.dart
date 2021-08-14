import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';



class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude,String address,String name) async {
    // String googleUrl ='https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
        // MapsLauncher.launchCoordinates(latitude, longitude, 'Google Headquarters are here',);
        // MapsLauncher.launchQuery('333-334 3rd Floor Laxmi Enclave, opp. Gajera School, Katargam, Surat, Gujarat 395004');
        MapsLauncher.launchQuery('$name,$address');
        // 'https://www.google.com/maps/search/?api=1&query=infusion+field';
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl).then((value) {
    //     // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    //     // print(value);
    //     // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    //   });
    // } else {
    //   throw 'Could not open the map.';
    // }
  }
}

LatLng center;

// ignore: must_be_immutable
class GoogleLocation extends StatefulWidget {
  String mapspacename;
  String rate;
  String address;
  String name;
    GoogleLocation(LatLng latLng,String spacename,this.rate,this.address,this.name){
      center=latLng;
      mapspacename=spacename;
    }
    // final DocumentSnapshot info;
    // final LatLng latLng;
  @override
  _GoogleLocationState createState() => _GoogleLocationState();
}

class _GoogleLocationState extends State<GoogleLocation> {

  // DocumentSnapshot info;
  // _GoogleLocationState(this.center);
  // LatLng info;

  Completer<GoogleMapController> _controller = Completer();
  
// LatLng latLng=new LatLng(geo.latitude, geo.longitude); 
  // LatLng center;

  LatLng _lastMapPosition = center;

  MapType _currentMapType = MapType.normal;

  final Set<Marker> _markers = {};

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: '${widget.mapspacename}',
          snippet: '${widget.rate } ⭐',          
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

@override
void initState() { 
   _lastMapPosition = center;
  _onAddMarkerButtonPressed();
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
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
              target: center,
              zoom: 11.0,
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
                  SizedBox(height: 16.0),
                  // FloatingActionButton(
                  //   onPressed: _onAddMarkerButtonPressed,
                  //   materialTapTargetSize: MaterialTapTargetSize.padded,
                  //   backgroundColor: Colors.green,
                  //   child: const Icon(Icons.add_location, size: 36.0),
                  //   heroTag: 'tag2',
                  // ),
                  // SizedBox(height: 16.0),
                  FloatingActionButton(
                    onPressed: () {
                      MapUtils.openMap(center.latitude, center.longitude,widget.address,widget.name);
                      // launchMap();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.location_on, size: 36.0),
                    heroTag: 'tag3',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
