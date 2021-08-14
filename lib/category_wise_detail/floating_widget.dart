// used for map center float  buttton
// import 'package:coworking_space/google_map/all_location_main_body.dart';
// import 'package:coworking_space/google_map/all_place_ingoogle_map_marker.dart';
import 'package:coworking_space/google_map/all_location_main_body.dart';
// import 'package:coworking_space/google_map/prac2.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/constants.dart';

class FloatingWidget extends StatelessWidget {
  final IconData leadingIcon;
  final String txt;
  final String catId;
  FloatingWidget({
    Key key,
    this.leadingIcon,
    this.txt,
    this.catId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 150,
      child: FloatingActionButton(
        elevation: 5,
        onPressed: () {
          print("clicked");
          // Navigator.push(context,MaterialPageRoute(builder: (context) => Allmapbody()));          
          Navigator.pushNamed(context, Allmapbody.routeName,arguments:{'cat_id':catId});  
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
        //heroTag: null,
        child: Ink(
          decoration: BoxDecoration(
            color: ColorConstant.kFABBackColor,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
