import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/category_wise_detail/cat_place.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

// class Mycat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       // width: 120,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 5,
//         itemBuilder: (context,index){
//         return Padding(
//           padding: EdgeInsets.all(20),          
//           child: Container(
//             // padding: EdgeInsets.all(15),
//             child: Card(
//               margin: EdgeInsets.all(10),
//               // height: 190,
//               // width: 120,
//       //     decoration: BoxDecoration(
//       //             color: Colors.white24,
//       //             borderRadius: BorderRadius.circular(15),
//       //             border: Border.all(color: Colors.black26)
//       // ),
//       elevation: 8,
//       color: Colors.white,
      
//       // margin: EdgeInsets.all(20),      
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               // color: Colors.white,
//               child: Column(
//                 children: [
//                   Image.asset("assets/images/m1.png"),
//                   Text("meeting")
//                 ],
//               )
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class Demo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(20),
//       height: 120,
//       // color: Colors.white70,  
//       child: 
//         ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 3,
//           itemBuilder: (context,index){
//            return Card(
//               elevation: 1,
//       color: Colors.white,              
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//              child: Container(
//               margin: EdgeInsets.only(right: 20),
//               width: 110,
//               height: 110,
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white70,
//                 borderRadius: BorderRadius.circular(15),
//                 // border: Border.all(color: Colors.black26)
                
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Image.asset("assets/images/m1.png"),
//                     // mapval.keys.elementAt(0),
//                   //  Text(innerMap.keys.elementAt(0),
//                   //           textAlign: TextAlign.center,
//                   //           style: TextStyle(
//                   //               color: Colors.black, letterSpacing: 1.2, fontSize: 11))
//                   //       : Container(),
//                     Text(
//                       "hello",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 15,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//           ),
//            );
//           }
//         ),      
//     );
//   }
// }

mycat(){
   return
     Container(
      // padding: EdgeInsets.only(top: 15),
      // height: 200,
      padding: EdgeInsets.only(top: 15, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Category",
              style: TextStyle(
                color: Colors.black,
                // fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          
// ---------------
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 150,
            child: FutureBuilder(
              future: Firestore.instance.collection('category').getDocuments(),
              builder:(context, snapshot){
              if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator());
                   }else{
                    //  print(snapshot.data.documents.length);
              return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    if(selectedLocation.isNotEmpty)            
            Navigator.pushNamed(context,CategoryWiseProductPage.routeName,arguments:{'SpaceCategory':snapshot.data.documents[index],'cat_id':snapshot.data.documents[index].documentID});
        else
           {             
             // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(SnackBar(  
            content: Text('city must be choosen.!!! '),  
            duration: Duration(seconds: 5),  
            action: SnackBarAction(  
              label: 'use default',  
              onPressed: () {  
                // Some code to undo the change.  
                selectedLocation="surat";
              },  
            ),  
          ),);  
           }
                  },
                  child: ListItem(
                    sheetItemHeight: 110,
                    myicon: snapshot.data.documents[index]['icon'],
                    name: snapshot.data.documents[index]['name'],
                    // mapval: info.spaces.spaceinfo[index],
                  ),
                );
              },
            );
              }
            }),            
          ),
          // --------------

          // Container(
          //   margin: EdgeInsets.only(top: 15),
          //   height: 150,
          //   child: StreamBuilder( 
          //     stream: Firestore.instance.collection('category').snapshots(),              
          //     builder: (context,snapshot){
          //       print(snapshot);
          //       if(snapshot.hasData){
          //          return Center(child: CircularProgressIndicator());
          //          }else{print(snapshot.data.documents.length);
        //       return ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount:snapshot.data.documents.length,
        //       itemBuilder: (context, index) {
        //         return GestureDetector(
        //           onTap: (){
        //             if(selectedLocation.isNotEmpty)            
        //     Navigator.pushNamed(context,CategoryWiseProductPage.routeName,arguments:{'SpaceCategory':snapshot.data.documents[index],'cat_id':snapshot.data.documents[index].documentID});
        // else
        //    {             
        //      // ignore: deprecated_member_use
        //   Scaffold.of(context).showSnackBar(SnackBar(  
        //     content: Text('city must be choosen.!!! '),  
        //     duration: Duration(seconds: 5),  
        //     action: SnackBarAction(  
        //       label: 'use default',  
        //       onPressed: () {  
        //         // Some code to undo the change.  
        //         selectedLocation="surat";
        //       },  
        //     ),  
        //   ),);  
        //    }
        //           },
        //           child: ListItem(
        //             sheetItemHeight: 110,
        //             myicon: snapshot.data.documents[index]['icon'],
        //             name: snapshot.data.documents[index]['name'],
        //             // mapval: info.spaces.spaceinfo[index],
        //           ),
        //         );
        //       },
        //     );
          //     }
          //     })
          // )
        ],
      ),
    );
}

class ListItem extends StatelessWidget {
  final double sheetItemHeight;
  final String myicon;
  final String name;
  // final Map mapVal;
  // final Map<Icon, String> mapval;

  ListItem({this.sheetItemHeight,this.myicon,this.name});

  @override
  Widget build(BuildContext context) {
    // var innerMap;
    // bool isMap;

  
    // if (mapval.values.elementAt(0) is Map) {
    //   innerMap = mapval.values.elementAt(0);
    //   isMap = true;
    // } else {
    //   innerMap = mapval;
    //   isMap = false;
    // }

    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 110,
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.white),        
        borderRadius: BorderRadius.circular(15),
      //   boxShadow: [
      //               BoxShadow(
      //                 color: Colors.grey,
      //                 offset: const Offset(
      //                   5.0,
      //                   5.0,
      //                 ),
      //                 blurRadius: 10.0,
      //                 spreadRadius: 2.0,
      //               ),]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // mapval.keys.elementAt(0),
          // Image.asset("assets/images/m1.png"),
          Image.network(myicon),
          // isMap
          //     ? Text(innerMap.keys.elementAt(0),
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             color: Colors.black, letterSpacing: 1.2, fontSize: 11))
          //     : Container(),
          Text(
            "$name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
