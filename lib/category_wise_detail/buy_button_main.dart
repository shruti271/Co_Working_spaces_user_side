// import 'package:coworking_space/book_now_cat/toggle_bar_book.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

// ignore: must_be_immutable
class RentButton extends StatelessWidget {
  // get kfullAppColor => null;
  final String routeName;
  DocumentSnapshot info;

  RentButton({@required this.routeName, this.info});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName,arguments: {'placedata':info});
          },
          child: Text(
            "book now",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1.4,
                fontFamily: "arial"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          color: ColorConstant.kfullAppColor,
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
