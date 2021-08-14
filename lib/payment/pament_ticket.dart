// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // const String _TITLE = 'DottedLine Demo';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: _TITLE,
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: _MyHomePage(),
// //     );
// //   }
// // }

// class MYdemo extends StatefulWidget {
//   final DocumentSnapshot docsnap ;
//   MYdemo({this.docsnap});
//   @override
//   MYdemoState createState() => MYdemoState();
// }

// class MYdemoState extends State<MYdemo> {
//   DocumentSnapshot placesnap;
//   @override
//   void initState() { 
//     super.initState();
//     print(widget.docsnap.data['place_id']);
//   }
//   @override
//   Widget build(BuildContext context) {
//     // final space = SizedBox(height: 50);
//     return StreamBuilder(
//       stream: Firestore.instance.collection("places").document(widget.docsnap.data['place_id']).snapshots(),
//       builder: (context, snapshot) {
//         // print(snapshot.data['']);
//         // String name=snapshot.data['spacename'];
//         if(snapshot.hasData){
//         return Card(
//           elevation: 8,
//           color: Colors.white,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           margin: EdgeInsets.all(20),
//           child: IntrinsicHeight(
//             // mainaxissi: MainAxisSize.max,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                      decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
//                             color: Colors.grey.shade400,  
//                             ),
                                   
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       // crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("SEAT BOOEKED",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 Text("${DateTime.parse(widget.docsnap['mydate'].toDate().toString())}",style: TextStyle(color: Colors.black87),),
//                           Text("to",style: TextStyle(fontSize: 20,color: Colors.black),),
//                           Text("${DateTime.parse(widget.docsnap['end_date'].toDate().toString())}",style: TextStyle(color: Colors.black87),),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("${DateTime.now().difference(DateTime.parse(widget.docsnap['mydate'].toDate().toString())).inDays} day left",style: TextStyle(color: Colors.red),),
//                         )
//                         ],
//                     ),
//                   ),
//                 ),
//                 DottedLine(
//                   direction: Axis.vertical, dashColor: Colors.black,
//                   dashLength: 10,
//                   // dashGapLength: 30,
//                   lineLength: 150,
//                   // lineThickness: 30,
//                 ),
//                 Expanded(
//                   flex: 4,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         // Text("id"),
//                         Text("${snapshot.data['spacename']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                         SizedBox(height: 10,),
//                         Text("${snapshot.data['address']}"),
//                         SizedBox(height: 10,),
//                         Text("${DateTime.parse(widget.docsnap['book_date'].toDate().toString())}"),
//                         ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//         }else{
//           return Text("No Ticket");
//         }
//       }
//     );
//   }
// }







//  12-7 changee
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// const String _TITLE = 'DottedLine Demo';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _TITLE,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: _MyHomePage(),
//     );
//   }
// }

class MYdemo extends StatefulWidget {
  final DocumentSnapshot docsnap ;
  MYdemo({this.docsnap});
  @override
  MYdemoState createState() => MYdemoState();
}

class MYdemoState extends State<MYdemo> {
  DocumentSnapshot placesnap;
  @override
  void initState() { 
    super.initState();
    print(widget.docsnap.data['place_id']);
  }
  @override
  Widget build(BuildContext context) {
    // final space = SizedBox(height: 50);
    return StreamBuilder(      
      stream: Firestore.instance.collection("places").document(widget.docsnap.data['place_id']).snapshots(),
      builder: (context, snapshot) {
        // print(snapshot.data['']);
        // String name=snapshot.data['spacename'];
        
        if(snapshot.hasData){
        return Card(
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(20),
          child: IntrinsicHeight(
            // mainaxissi: MainAxisSize.max,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                     decoration: (DateTime.now().isBefore(widget.docsnap['mydate'].toDate()))
                     ?
                     BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                            color: Colors.grey.shade400,  
                            )
                            :
                            BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                            color: Colors.red[700],  
                            ),
                                   
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("SEAT BOOEKED",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text("${DateTime.parse(widget.docsnap['mydate'].toDate().toString())}",style: TextStyle(color: Colors.black87),),
                          Text("to",style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text("${DateTime.parse(widget.docsnap['end_date'].toDate().toString())}",style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),
                        ),
                       (DateTime.now().isBefore(widget.docsnap['mydate'].toDate()))? Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: Text("${DateTime.now().difference(DateTime.parse(widget.docsnap['mydate'].toDate().toString())).inDays} day left",style: TextStyle(color: Colors.red),),
                          child: Text("${DateTime.parse(widget.docsnap['mydate'].toDate().toString()).difference(DateTime.now()).inDays } day left",style: TextStyle(color: Colors.red),),
                          
                        ):Container()
                        ],
                    ),
                  ),
                ),
                DottedLine(
                  direction: Axis.vertical, dashColor: Colors.black,
                  dashLength: 10,
                  // dashGapLength: 30,
                  lineLength: 150,
                  // lineThickness: 30,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Text("id"),
                        Text("${snapshot.data['spacename']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("${snapshot.data['address']}"),
                        SizedBox(height: 10,),
                        Text("${DateTime.parse(widget.docsnap['book_date'].toDate().toString())}"),
                        ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
