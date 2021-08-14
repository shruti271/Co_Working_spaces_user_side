import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Stream<List<DocumentSnapshot>>> getNearbyStores(LatLng location) async{

    Geoflutterfire geo = Geoflutterfire();

    GeoFirePoint center =geo.point(latitude: location.latitude, longitude: location.longitude);

    var collectionRef =Firestore.instance.collection('loc_check');//= db.collection('shops');

    var geoRef = geo.collection(collectionRef: collectionRef).within(
        center: center, radius: 100, field: 'location', strictMode: false);

        
print(geoRef.first);
print("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.....................]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
List<String> str;
geoRef.listen((List<DocumentSnapshot> documentList) {
        // _updateMarkers(documentList);
        
        for(int i=0;i<documentList.length;i++){
          str.add(documentList[i].documentID);
        }
      });

      print(str);
    return geoRef;

  }


  // Stream getProducts(List<DocumentReference> nearByShopsReferences) {
    
  //   getNearbyStores(LatLng(21.2060, 72.8866));
  //   Stream<QuerySnapshot> prods = Firestore.instance.collection('products').where('shop', whereIn: nearByShopsReferences).snapshots();

  //   return prods;
  // }