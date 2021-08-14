import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'placedetailpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ImageWidget extends StatefulWidget {
  DocumentSnapshot info;
  ImageWidget(
    this.info,
  );

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  static Position pos;
// GeoPoint geo ;
  double _curdisme;
  Timer _timer;
  Timer _timer1;

  Future<Position> curlo() async {
    // Future.delayed(Duration(seconds: 2), () async {
    _timer = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      print(value);
      // if (mounted) {
      setState(() {
        // Your state change code goes here
        pos = value;
        // print("!!!!!!!!!!!!!!!postion $pos");
      });
      // }

      return;
    });
    // });
    // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!postion $pos");
    return pos;
  }

  Future<double> distme(GeoPoint geo) async {
//  double curdisme;
    // Future.delayed(Duration(seconds: 2), () async {
    _timer1 = await Geolocator()
        .distanceBetween(
            pos.latitude, pos.longitude, geo.latitude, geo.longitude)
        .then((value) {
      if (this.mounted) {
        setState(() {
          //  if(this.mounted){
          _curdisme = value / 1000;
          // print("!!!!!!!!!!!!!!!distance between $_curdisme");
          //  }
        });
      }
      return;
    });
    // });
    // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!distance between $_curdisme");
    return _curdisme;
  }

  @override
  void initState() {
    curlo();
    print(
        "---------------------???????????????????=======================here is error");
    super.initState();
  }

  @override
  void dispose() {
    _timer1?.cancel();
    _timer?.cancel();

    super.dispose();
    // _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Color favcolor = ColorConstant.kWhiteColor;

    GeoPoint geo = widget.info['location'];
    // curlo();
    distme(geo);
    // print("--------+++++++++========= spacename ${widget.info['spacename']}");
    // print(_curdisme);
    // print("??????????????????????????");

    return Card(
      elevation: 20,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LayoutStarts(
                    info: widget.info,
                  ),
                ),
              );
            },
            child: Container(
              height: 160,
              width: screenWidth,
              padding: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    // image:Image.network("gs://coworking-app-cd89c.appspot.com/desk91.jpg"),
                    image: NetworkImage(widget.info['img'][0])),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        color: favcolor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      // child: Favstorecard(imgIndex: imgpath_index),
                      child: favicon(pid: widget.info.documentID),
                      // Favstorecard(imgIndex: 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //  ------------------------------
          (widget.info.data.containsKey('spacename'))
              ? Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: Text(
                    "${widget.info['spacename']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    // "\$ 200" ,
                  ),
                )
              : Container(),

          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                (widget.info.data.containsKey('hour_price'))
                    ? Text(
                        // house.address,
                        "Rs." + widget.info['hour_price'].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )
                    : Text(""),

                SizedBox(
                  width: 10,
                ),

                (widget.info.data.containsKey('day_price'))
                    ? Text(
                        // house.address,
                        "Rs." + widget.info['day_price'].toString(),
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )
                    : Text(""),
                SizedBox(
                  width: 50,
                ),

                Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Expanded(
                    child: (_curdisme != null) ? Text("${_curdisme.toStringAsFixed(2)} Km") : Text(""),
                    // Disfromuser(lat: geo.latitude, lon: geo.longitude)
                    //  Future.delayed(Duration(seconds: 3),()async {
                    //  return await Disfromuser(lat: geo.latitude, lon: geo.longitude));
                    // }),
                  ),
                ),
                // Text(
                //   // house.address,
                //   // "${Distanceinkm(despos: info['location'])}",
                //   "${geo.latitude}",
                //   style: TextStyle(fontSize: 22,color: Colors.black),
                // ),
                // ),
              ],
            ),
          ),
          // -------------------
          // Container(
          //   child: Expanded(child: Text("hello")),
          // ),

          (widget.info.data.containsKey('address'))
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 0,
                    bottom: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.orangeAccent[700],
                        ),
                        Expanded(
                          child: Text(
                            // house.address,
                            "${widget.info['address']}",
                            style: TextStyle(fontSize: 10),
                            // style: GoogleFonts.notoSans(
                            //   fontSize: 15,
                            //   color: ColorConstant.kGreyColor,
                            // ),
                          ),
                        ),
                        // Text("in 0.91 km"),
                      ]),
                )
              : Text(""),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
// class Favstorecard extends StatefulWidget {
//   final int imgIndex;
//   // int index;

//   Favstorecard({
//     Key key,
//     this.imgIndex,
//     // @required this.index,
//   }) : super(key: key);
//   @override
//   _FavstorecardState createState() => _FavstorecardState();
// }

// class _FavstorecardState extends State<Favstorecard> {
//   @override
//   Widget build(BuildContext context) {
//     Color _favcolor = Colors.black;
//     return IconButton(
//         icon: Icon(
//           Icons.favorite_border,
//           color: _favcolor,
//         ),
//         onPressed: () {
//           print("heart clicked");
//           setState(() {
//               _favcolor = Colors.red;
//             });
//           if (!fav.contains(widget.imgIndex)) {
//             fav.add(widget.imgIndex);
//             setState(() {
//               _favcolor = Colors.red;
//             });
//           } else {
//             fav.remove(widget.imgIndex);
//             setState(() {
//               _favcolor = Colors.black;
//             });
//           }
//           print(fav);
//         });
//   }
// }

String user ;
Future<void> getdata() async {
   final prefs = await SharedPreferences.getInstance();
 user = prefs.getString('current_login_user');

 //print("??????????????????::::::::::::::::::::::::"+user);
}

// ignore: camel_case_types
class favicon extends StatefulWidget {
  favicon({this.pid});
  final String pid;
  @override
  _faviconState createState() => _faviconState();
}

// ignore: camel_case_types
class _faviconState extends State<favicon> {
  Color _favIconColor = Colors.grey;
  @override
  void initState() {
    super.initState();
    getdata();
    Firestore.instance
        .collection('userdetails')
        .document(user)
        .get()
        .then((value) {
      List<String> lt = List.from(value.data['favplaces']);
      setState(() {
        if (lt.contains(widget.pid)) {
          _favIconColor = Colors.red;
          print("yes=================!!!!!!???????????");
        } else {
          _favIconColor = Colors.grey;
          print("no=================!!!!!!???????????");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          icon: Icon(Icons.favorite),
          color: _favIconColor,
          tooltip: 'Add to favorite',
          onPressed: () {
            setState(() {
              if (_favIconColor == Colors.grey) {
                _favIconColor = Colors.red;

                Firestore.instance
                    .collection('userdetails')
                    .document(user)
                    .updateData({
                  'favplaces': FieldValue.arrayUnion([widget.pid])
                }).then((value) {
                  print("successful completed!-----------");
                });
                print("added");
              } else {
                _favIconColor = Colors.grey;
                Firestore.instance
                    .collection('userdetails')
                    .document(user)
                    .updateData({
                  'favplaces': FieldValue.arrayRemove([widget.pid])
                }).then((value) {
                  print("successful completed!-----------");
                });
              }
            });
          }),
    );
  }
}
