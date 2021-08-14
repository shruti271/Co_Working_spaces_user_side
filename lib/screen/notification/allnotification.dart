// // import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:coworking_space/size_config.dart';
// import 'package:flutter/material.dart';

// class allnotification extends StatefulWidget {
//   // const allnotification({ Key? key }) : super(key: key);
//   final DocumentSnapshot cdata;
//   allnotification({@required this.cdata});
//   @override
//   _allnotificationState createState() => _allnotificationState();
// }

// class _allnotificationState extends State<allnotification> {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topLeft,
//           child: Container(
//         margin: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           border: Border.all(width: 0.05),
//                           // image: 
//                           // new DecorationImage(
//                           //   image: NetworkImage(widget.cdata['img'][0]),//widget.info['img'][0]
//                           //   fit: BoxFit.fill,
//                           ),
//         // color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                   child: Text(" "+widget.cdata["title"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),
//                 )
//                 ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(" "+widget.cdata["body"])
//                 ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Column(
//                   children: [
//                     Text(" " +"${DateTime.parse(widget.cdata['date'].toDate().toString())}"+" "),
//                   ],
//                 ), // Text("widget"),
//               )
//               // Text("HHHHHHHHHHHHHHHHHHHHHHHHbehwbfhewbfj"),
//               //  Text("HHHHHHHHHHHHHHHHHHHHHHHHbehwbfhewbfj"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// 12-7 change

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class allnotification extends StatefulWidget {
  // const allnotification({ Key? key }) : super(key: key);
  final DocumentSnapshot cdata;
  allnotification({@required this.cdata});
  @override
  _allnotificationState createState() => _allnotificationState();
}

// ignore: camel_case_types
class _allnotificationState extends State<allnotification> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
          child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(width: 0.05),
                          // image: 
                          // new DecorationImage(
                          //   image: NetworkImage(widget.cdata['img'][0]),//widget.info['img'][0]
                          //   fit: BoxFit.fill,
                          ),
        // color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                  child: Text(" "+widget.cdata["title"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),
                )
                ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(" "+widget.cdata["body"])
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
                    Text(" " +"${DateTime.parse(widget.cdata['date'].toDate().toString())}"+" "),
                  ],
                ), // Text("widget"),
              )
              // Text("HHHHHHHHHHHHHHHHHHHHHHHHbehwbfhewbfj"),
              //  Text("HHHHHHHHHHHHHHHHHHHHHHHHbehwbfhewbfj"),
            ],
          ),
        ),
      ),
    );
  }
}
