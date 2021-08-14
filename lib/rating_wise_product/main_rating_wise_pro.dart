// import 'package:coworking_space/size_config.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/rating_wise_product/bluerating_wise.dart';
// import 'package:coworking_space/rating_wise_product/rating_card.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Myratingcard extends StatefulWidget {

  final DocumentSnapshot cdata;
  Myratingcard({@required this.cdata});
  @override
  _MyratingcardState createState() => _MyratingcardState();
}

class _MyratingcardState extends State<Myratingcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 9,
            left: 5,
            right: 5,
            child: Card(
              semanticContainer: true,              
              elevation: 20,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:
                    Container(
                      height: 200,
                      width: SizeConfig.screenWidth,
                      // width: 300,                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: 
                        new DecorationImage(
                          image: NetworkImage(widget.cdata['img'][0]),//widget.info['img'][0]
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  
           

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              margin: EdgeInsets.all(10),
            ),
          ),
          Positioned(
            // top: MediaQuery.of(context).size.height * .25,
            // left: 15,
            // right: 15,
            // bottom: 50,
            top: 0,
            right: 0,
            child: Card(              
              elevation: 8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                  ),            
                child: Placerating(info : widget.cdata['rating'].toDouble()),                
            ),
          ),
        ],
      ),
    );
  }
}
