import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/category_wise_detail/features_detail.dart';
// import 'package:coworking_space/google_map/all_place_ingoogle_map_marker.dart';
import 'package:coworking_space/google_map/map_body.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'buy_button_main.dart';
import 'package:coworking_space/book_now_cat/toggle_bar_book.dart';

// ignore: must_be_immutable
class SheetContainer extends StatelessWidget {
  final DocumentSnapshot info;
  SheetContainer({@required this.info});

  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 80;
    // var pos =info['location'].getLocation();

    GeoPoint geo = info['location'];
    // ignore: unused_local_variable
    final LatLng latLng = new LatLng(geo.latitude, geo.longitude);
    // print(latLng);

// print("=======================________________-----------......");
    return DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.65,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.only(top: 25, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Color(0xfff1f1f1)),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        (info.data.containsKey('spacename'))
                            ? Container(
                                // padding: EdgeInsets.all(20),
                                child: Text(
                                  "${info['spacename']}".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            : Container(),

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (info.data.containsKey('type'))
                                ? Text(info['type'])
                                : Container(),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.star_border),
                                  (info.data.containsKey('rating'))
                                      ? Text(info['rating']
                                          .toStringAsFixed(2)
                                          .toString())
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        (info.data.containsKey('placeofcity'))
                            ? Text(
                                info['placeofcity'],
                              )
                            : Container(),

                        SizedBox(
                          height: 10,
                        ),
                        // Spacefacility(amenities: info.amenities, spaceinfo: info.spaceinfo),
                        // offerDetails(sheetItemHeight, info.amenities),
                        (info.data.containsKey('amenities'))
                            ? features(sheetItemHeight, info, "amenities")
                            : Container(),
                        (info.data.containsKey('spaceinfo'))
                            ? features(sheetItemHeight, info, "spaceinfo")
                            : Container(),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adress",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Text(info['address']),
                              ),
                            ],
                          ),
                        ),

                        (info.data.containsKey('amenities'))
                            ? Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "overview",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(info['overview']),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),

                        SizedBox(height: 20),

                        GoogleLocation(
                            LatLng(geo.latitude, geo.longitude),
                            info['spacename'],
                            info['rating'].toStringAsFixed(1).toString(),info['address'],info['spacename']),

                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            child: Column(
                              children: [
                                (info.data.containsKey('hour_price'))
                                    ? Text(
                                        "Per Hour : Rs. " +
                                            info['hour_price'].toString() +
                                            "/-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      )
                                    : SizedBox(height: 0,),
                                SizedBox(
                                  height: 20,
                                ),
                                (info.data.containsKey('day_price'))
                                    ? Text(
                                        "Per Day : Rs. " +
                                            info['day_price'].toString() +
                                            "/-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      )
                                    :SizedBox(height: 0,),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        RentButton(
                          routeName: Booktoggle.routeName,
                          info: info,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        Column(
                          
                          children: [
                            Text("CONTACT US",style: TextStyle(fontSize: 20,color: Colors.red[900]),),
                            SizedBox(height: 20,),
                            (info.data.containsKey('phone_number'))
                                ? Row(
                                    // mainAxisAlignment:
                                        // MainAxisAlignment.spaceBetween,
                                    children: [
                                        IconButton(
                                          onPressed: () async {
                                            final url = 'tel:' +
                                                info['phone_number'].toString();
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              Text('Could not launch $url');
                                            }
                                          },
                                          icon: Icon(Icons.call),
                                          color: Colors.green),
                                      Text(
                                        "+ 91 ${info['phone_number']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                    
                                    ],
                                  )
                                : Text(""),

                            // SizedBox(
                            //   height: 2,
                            // ),

                            (info.data.containsKey('email'))
                                ? Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                       IconButton(
                                          onPressed: () async {
                                            await launch("mailto:" +
                                                info['email'] +
                                                "?subject=Query for booking of " +
                                                info['spacename']);
                                          },
                                          icon: Icon(Icons.email),
                                          color: Colors.yellow[800]),
                                      Text(
                                        "${info['email']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                                     
                                    ],
                                  )
                                : Text(""),
                          ],
                        ),

                        SizedBox(height: 50),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
