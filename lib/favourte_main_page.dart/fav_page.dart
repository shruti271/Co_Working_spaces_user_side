import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/category_wise_detail/placedetailpage.dart';
import 'package:flutter/material.dart';


class MyfavCard extends StatelessWidget {
  final String placesid;

  MyfavCard({this.placesid});
// DocumentSnapshot docsnap;

  @override
  Widget build(BuildContext context) {
    // docsnap=Firestore.instance.collection("places").document(placesid).get() as DocumentSnapshot;
    return StreamBuilder(
      stream: Firestore.instance.collection("places").document(placesid).snapshots() ,
      // initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
        return Container(
          child:  Card(
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
                    info: snapshot.data,
                  ),
                ),
              );
            },
            child: Container(
              height: 260,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:NetworkImage(snapshot.data['img'][0]),
                    // image: AssetImage("imgs/o6.jpg")
                    ),
              ),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 10,
                  //   ),
                  //   child: Container(
                  //     height: 50.0,
                  //     width: 50.0,
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(18),
                  //     ),
                  //     // child: Favstorecard(imgIndex: imgpath_index),
                  //     // child: favicon(pid: widget.info.documentID),
                  //     // Favstorecard(imgIndex: 0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          //  ------------------------------
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
            ),
            child: Text(
              snapshot.data['spacename'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // "\$ 200" ,
            ),
          ),

       
                
        ],
      ),
    ),
        );
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}