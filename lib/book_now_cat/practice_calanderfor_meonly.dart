// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:coworking_space/screen/cart/components/check_out_card.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../constants.dart';


// DateTime dtm;
// DateTime dtm2;
// DateTime dateforhorend;

// BookinDetails b1;
// // int currentCount=0;
// int dayindiff=0;

// int dayintotalprice;


// class Mydaypriceshowinfcontainer extends StatefulWidget {
//   Mydaypriceshowinfcontainer({@required this.curdayprice});
//   final int curdayprice;
//   @override
//   _MydaypriceshowinfcontainerState createState() => _MydaypriceshowinfcontainerState();
// }

// class _MydaypriceshowinfcontainerState extends State<Mydaypriceshowinfcontainer> {
//   int getpaymnt(){
//      if(dtm2!=null ){
//        setState(() {
//                 dayindiff= dtm2.difference(dtm).inDays;
//               });
       
//     }
//     if(dayindiff!=null && dtm2!=null){
//     setState(() {
//           dayintotalprice=dayindiff*widget.curdayprice;
//         });
//     }
//     return dayintotalprice;
//   }

//   @override
//   Widget build(BuildContext context) {
//     getpaymnt();
//     return Container(
//     child: Text("for 1 day = ${widget.curdayprice}   $dayindiff total = ${getpaymnt()}"),
//   );
//   }
// }


// class Booktoggle extends StatefulWidget {
//   static String routeName = "/tooglebook";

//   // final DocumentSnapshot info;
//   // Booktoggle({this.info});
//   @override
//   _BooktoggleState createState() => _BooktoggleState();
// }

// class _BooktoggleState extends State<Booktoggle> {

//   int myoption = 0;
//   Color hourcolor = Colors.cyan;
//   Color daycolor = Colors.grey;
  
//   int totalhourprice=1;
//   int totaldayprice=1;
//   int currentCount=0;

//   @override
//   void initState() {
//     super.initState();
//     // datefire();
//   }

//   void uchooseme(int me) {
//     setState(() {
//       myoption = me;
//     });
//   }

// //for hour price counting  
// Widget mycounterHours(int currenthrpr,String id){
//   void minus() {
//   setState(() {
    
//     if (currentCount != 0)     
//     {        
//       currentCount--;
//       dateforhorend=dtm.subtract(Duration(hours: 1));
//      totalhourprice=currentCount * currenthrpr;
      
//     // c.dicreaseme();
//     }
//   });
// }

// void add(DateTime cdtm)async {
//   // setState(() {
//     // currentCount++;
//     dateforhorend=cdtm;
//     dateforhorend=dateforhorend.add(new Duration(hours: currentCount));
//     print("this hour is not allowed--------------------- $dateforhorend         ----------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//     // totalhourprice=currentCount * currenthrpr;
//   // });
//   await datefireme(dateforhorend,"ok",id).then((value) {
//         if(value==false)
//         {
//           print("this hour is not allowed-------------------------------------------????????????????????????????????????????");
//            showDialog(
//                       context: context,
//                       builder: (ctx) => AlertDialog(
//                         title: Text("Alert Dialog Box"),
//                         content: Text("You can't take more hores now "),
//                         actions: <Widget>[
//                           // ignore: deprecated_member_use
//                           FlatButton(
//                             onPressed: () {
//                               Navigator.of(ctx).pop();
//                             },
//                             child: Text("okay"),
//                           ),
//                         ],
//                       ),
//                     );
//                 setState(() {
//                                   currentCount--;
//                });    
//         }else{
//           setState(() {
//                       totalhourprice=currentCount * currenthrpr;
//                     });
//         }
//       }
//       );
//   }

//   return Container(
//       child:  Column(
//         children: [
//           SingleChildScrollView(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   new FloatingActionButton(
//                     onPressed: (){
//                       setState(() {
//                             currentCount++;
//                          });
//                       add(dtm);
//                     },
//                     child: new Icon(Icons.add, color: Colors.black,),
//                     backgroundColor: Colors.white,),

//                   new Text('$currentCount',
//                       style: new TextStyle(fontSize: 60.0)),

//                   new FloatingActionButton(
//                     onPressed: minus,
//                     child: new Icon(Icons.remove,color: Colors.black,),                 
//                     backgroundColor: Colors.white,),
//                 ],
//               ),
//           ),
//           SizedBox(height: 20,),
//           (currentCount!=0)?Text("Price for hour=$currentCount Hours price=$totalhourprice"):Text(""),
//         ],
//       ),      
//     );
// }

// int totalday;
// Widget totalpriceforday(int totalprice)
// {
//   int getdif(){
//     setState(() {
//           totalday=dtm2.difference(dtm).inDays;
//         });
    
//     return totalday;
//   }

//   int totalpayableamountforday(){
//     setState(() {
//           totaldayprice=totalprice*getdif();
//         });
//     return totaldayprice;
//   }
// return Center(
//   child: Container(
//     child: Text("${getdif()}  day for total = ${totalpayableamountforday()}  temp = $totalprice"),
//   ),
// );
// }

// Widget showtotalpricefortotalday(int curdayprice){

// print("=====================================================dtm2=$dtm2 ==dtm=$dtm");
//   int getpaymnt(){
//      if(dtm2!=null ){
//       //  setState(() {
//                 // dayindiff= dtm2.difference(dtm).inDays;
//               // });
       
//     }
//     if(dayindiff!=null && dtm2!=null){
//     setState(() {
//           dayintotalprice=dayindiff*curdayprice;
//         });
//     }
//     return dayintotalprice;
//   }
//   getpaymnt();
//   return Container(
//     child: Text("for 1 day = $curdayprice    $dayindiff total = ${getpaymnt()}"),
//   );
// }

// int getle(int pr){
//   setState(() {
//       totaldayprice=dayindiff * pr;
//       print("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--$totaldayprice");
//     });
//   return dayindiff * pr;
// }

// // main state code
//   @override
//   Widget build(BuildContext context) {
    
//     final Map arguments = ModalRoute.of(context).settings.arguments as Map;
//     final DocumentSnapshot cdata = arguments['placedata'];
//     int fromtogglebar;
//     // int _n=0;

//     return Scaffold(
//       appBar: AppBar(),
//       // bottomNavigationBar: CheckoutCard(),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(top:20,bottom: 20),
//                     child: (cdata.data().containsKey('hour_price'))?
//                     Text("${cdata['spacename']}",
//                   style: TextStyle(fontSize: 30, color: Colors.black),
//                 )
//                 :Text(""),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(top: 50),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // ToggleSwitch(
//                       //   minWidth: 120.0,
//                       //   cornerRadius: 20.0,
//                       //   activeBgColor: Colors.cyan,
//                       //   activeFgColor: Colors.white,
//                       //   inactiveBgColor: Colors.grey,
//                       //   inactiveFgColor: Colors.white,
//                       //   labels: ['Hours', 'Days'],
//                       //   onToggle: (index) {
//                       //     print('switched to: $index');
//                       //     //  myoption=index;
//                       //     uchooseme(index);
//                       //   },
//                       // ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Hero(
//                             tag: "hourwidget",
//                             child: (cdata.data().containsKey('hour_price'))
//                                 ? Container(
//                                     decoration: BoxDecoration(
//                                       color: (myoption == 0)
//                                           ? Colors.cyan
//                                           : Colors.grey,
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(30.0),
//                                         bottomLeft: Radius.circular(30.0),
//                                         bottomRight: Radius.circular(30.0),
//                                         topRight: Radius.circular(30.0),
//                                       ),
//                                     ),
//                                     // ignore: deprecated_member_use
//                                     child: FlatButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           if (myoption == 1) {
//                                             myoption = 0;
//                                           }
//                                         });
//                                       },
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(30)),
//                                       ),
//                                       child: Text(
//                                         "Hours",
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                             letterSpacing: 1.4,
//                                             fontFamily: "arial"),
//                                       ),
//                                     ),
//                                     padding: EdgeInsets.only(
//                                         top: 5, left: 5, bottom: 5, right: 5),
//                                     // ),
//                                   )
//                                 : Container(),
//                           ),
                         
//                           SizedBox(
//                             width: 20,
//                           ),

//                         Hero(
//                           tag: "daywidget",
//                           child: (cdata.data().containsKey('day_price'))?
//                             Container(
//                               decoration: BoxDecoration(
//                                 color:
//                                     (myoption == 1) ? Colors.cyan : Colors.grey,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30.0),
//                                   bottomLeft: Radius.circular(30.0),
//                                   bottomRight: Radius.circular(30.0),
//                                   topRight: Radius.circular(30.0),
//                                 ),
//                               ),
//                               // ignore: deprecated_member_use
//                               child: FlatButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (myoption == 0) {
//                                       // print("my color 1",);
//                                       // if(myoption==1){
//                                       // daycolor=Colors.grey;
//                                       // hourcolor=Colors.cyan;
//                                       myoption = 1;
//                                       // }
//                                     }
//                                   });
//                                 },
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30)),
//                                 ),
//                                 child: Text(
//                                   "Days",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       letterSpacing: 1.4,
//                                       fontFamily: "arial"),
//                                 ),
//                               ),
//                               padding: EdgeInsets.only(
//                                   top: 5, left: 5, bottom: 5, right: 5),
//                               // ),
//                             ):Container(),
//                         ),
//                         ],
//                       ),

//                       SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.calendar_today,
//                             color: Colors.red,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Expanded(
//                               child: BasicDateTimeField(
//                             title: "start DateTime",
//                             id:cdata.id,
//                             fromtogglebar: fromtogglebar,
//                           )),
//                         ],
//                       ),

//                       SizedBox(
//                         height: 20,
//                       ),

//                       (myoption == 1)
//                           ? Row(
//                               children: [
//                                 Icon(
//                                   Icons.calendar_today,
//                                   color: Colors.red,
//                                 ),
//                                 SizedBox(
//                                   width: 20,
//                                 ),
//                                 Expanded(
//                                     child: BasicDateTimeField(
//                                   title: "end DateTime",
//                                   id:cdata.id,
//                                   fromtogglebar: fromtogglebar,
//                                 )),
                                                                
//                               ],
//                             )
//                           : Container(),

//                       SizedBox(
//                         height: 20,
//                       ),

//                       (myoption == 0) ? mycounterHours(cdata['hour_price'],cdata.id) : Container(),  

//                       // (myoption ==1 && dtm2!=null) ? Mydaypriceshowinfcontainer( curdayprice: cdata['day_price'],):Container(),
//                       // (myoption ==1 ) ? Container(child: Text("dif day $dayindiff ${dayindiff * cdata['day_price']} -- ${getle(cdata['day_price'])}"),):Container(),
//                       // (myoption ==1 && dayindiff!=0) ? showtotalpricefortotalday(cdata['day_price']):Container(),
                      
// Text("$totaldayprice"),
// // totalpriceforday
//                       // (myoption == 1 )?Hourtotalprice(hporprice:cdata['day_price'],startdate: BookinDetails.dtm,enddate: BookinDetails.dtm2,):Container(),
// // Text("$totalhourprice"),
//                     //  (myoption ==1 ) ?totalpriceforday(cdata['day_price']):Container(),
//                       // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                      
//                       // CheckoutCard()
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // caleder 

// // ignore: must_be_immutable
// class BasicDateTimeField extends StatefulWidget {
//   String title;
//   String id;
//   int fromtogglebar;
//   BasicDateTimeField({this.title, this.id, this.fromtogglebar});

//   @override
//   _BasicDateTimeFieldState createState() => _BasicDateTimeFieldState();
// }

// class _BasicDateTimeFieldState extends State<BasicDateTimeField> {
//   final format = DateFormat("yyyy-MM-dd HH:mm");

//   bool mytaskcomeleted;
// // ------------------------ start
// //   Future<bool> datefire(DateTime dtmcur) async {
// //     // Future.delayed(Duration(seconds: 2), () async {
// //     bool cureentmybool;
// //     if (dtm != null) {
// //       await FirebaseFirestore.instance
// //           .collection('check')
// //           .where('place_id', isEqualTo: widget.id)
// //           .get()
// //           .then((element) {
// //         print(
// //             "}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}---------${widget.id}----------${element.docs.length}+++++");

// //         for (int i = 0; i < element.docs.length; i++) {
// //           var myd = (element.docs[i].data()['mydate'].toDate());
// //           var myd2 = (element.docs[i].data()['end_date'].toDate());
// //           print(
// //               "}++++++++++++++++++}++++++++++++}+++++++}---------$myd----------${element.docs.length}+++++");
// //           print(
// //               "}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}---------$myd2---------${element.docs.length}+++++");
// //           print(
// //               "}+++++++++++---------------------------------------------$dtmcur---------${element.docs.length}+++++");

// //           if (dtmcur.isBefore(myd) && dtmcur.isAfter(myd2) ) {
// //             // && (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) solve this after simple code done
// //             // if (myd.isBefore(dtm) && myd2.isAfter(dtm)) {
// //             print("--------dtm=$dtm}+}+---dtm2=$dtm2}----${element.docs.length}++++}++$myd +++++++$myd2++-------------  not allow ------------");
            
// //                if(widget.title=="start DateTime")dtm = null; 
// //                 if(widget.title=="end DateTime") dtm2=null;                    
// //             cureentmybool = false;
// //             print("?????????????????????/////////////////////////----------------return false");
// //             // return false;
// //             break;
// //           } else
// //             print(
// //                 "}++++++++}++$dtm}+}+++++}++${element.docs.length}++++}++$myd +++++++$myd2++------------- allow ------------");
// //                 cureentmybool = true;
// //           // return true;
// //         }
        
// //         print("}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}++++++++++++++++++");
// //       });
// //     }else{
// //       print("nedd to chose dtm first..........");
// //     }

  
// //     return cureentmybool;
// //   }
// // // ------------------------end
//   @override
//   Widget build(BuildContext context) {
//     var date;
//     var time;

//     return Column(children: <Widget>[
//       // Text('Basic date & time field (${format.pattern})'),
//       // Text("${widget.title}"),
//       DateTimeField(
//           format: format,
//           decoration: InputDecoration(
//           labelText: "DateTime",
//           hintText: "${widget.title}",
//           ),
//           validator: (DateTime dateTime) {
//                   if (dateTime == null) {
//                     return "Date Time Required";
//                   }
//                   return null;
//                 },
// //           on: (DateTime dattm){
// // print("------------------------------------------????????>>>>>>>>>>>>>>>>>>>>>>>>>>>");
// //           },
//           onShowPicker: (context, currentValue) async {
//             date = await showDatePicker(
//                 context: context,
//                 firstDate: DateTime(1900),
//                 initialDate: currentValue ?? DateTime.now(),
//                 lastDate: DateTime(2100),
//                 );
                
//             if (date != null) {
//               // final
//               time = await showTimePicker(
//                 context: context,
//                 initialTime:
//                     TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    
//               );                
//               // DateTime dtm=
//               if (widget.title == "start DateTime") {
//                 dtm = DateTimeField.combine(date, time);
//                 print("yes it is---srat DateTime----------------------------+++++++++++++++++++++++++++++");

//                 await datefireme(dtm,widget.title,widget.id).then((value) {
//                   print("--------what is it?-----------------$value");

//                   if (value == false) {
//                     print("yes it is---false----------------------------+++++++++++++++++++++++++++++");
//                     showDialog(
//                       context: context,
//                       builder: (ctx) => AlertDialog(
//                         title: Text("Alert Dialog Box"),
//                         content: Text("You have raised a Alert Dialog Box"),
//                         actions: <Widget>[
//                           // ignore: deprecated_member_use
//                           FlatButton(
//                             onPressed: () {
//                               Navigator.of(ctx).pop();
//                             },
//                             child: Text("okay"),
//                           ),
//                         ],
//                       ),
//                     );
//                     dtm = null;
//                     currentValue=null;
//                     return dtm;
//                     // ignore: dead_code
//                   } else {
//                     print(
//                         "yes it is----true---------------------------+++++++++++++++++++++++++++++");
//                     // dtm = DateTimeField.combine(date, time);
//                     // return dtm;
//                   }
//                 });
//                 return dtm;
//                } else {
//                 dtm2 = DateTimeField.combine(date, time);                 
//                 print(
//                     "yes it is---end  DateTime---------------$dtm2}------$dtm}-------+++++++++++++++++++++++++++++");

//                 await datefireme(dtm2,widget.title,widget.id).then((value) {
//                   print("--------what is it?-----------------$value");

//                   if (value == false) {
//                     print(
//                         "yes it is---false----------------------------+++++++++++++++++++++++++++++");
//                     showDialog(
//                       context: context,
//                       builder: (ctx) => AlertDialog(
//                         title: Text("Alert Dialog Box"),
//                         content: Text("You have raised a Alert Dialog Box"),
//                         actions: <Widget>[
//                           // ignore: deprecated_member_use
//                           FlatButton(
//                             onPressed: () {
//                               Navigator.of(ctx).pop();
//                             },
//                             child: Text("okay"),
//                           ),
//                         ],
//                       ),
//                     );
//                     dtm2 = null;
//                     return dtm2;
//                     // ignore: dead_code
//                   } else {
//                     print(
//                         "yes it is----true---------------------------+++++++++++++++++++++++++++++");
//                         setState(() {
//                              dayindiff=dtm2.difference(dtm).inDays;    
//                              print(">>>>>>>>>>>>>>>>??????????::::::::::::::::::::: $dayindiff");
//                         });
//                   }
//                 });
//                 return dtm2;
//               } //else of start date if
//               // return null;
//             }
//             return null;
//           }),
//     ]);
//   } } //steless main end


// // ------------------

// Future<bool> datefireme(DateTime dtmcur,String title,String id) async {
//     // Future.delayed(Duration(seconds: 2), () async {
//     bool cureentmybool;
//     if (dtm != null) {
//       await FirebaseFirestore.instance
//           .collection('check')
//           .where('place_id', isEqualTo: id)
//           .get()
//           .then((element) {
//         print(
//             "}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}---------$id----------${element.docs.length}+++++");

//         for (int i = 0; i < element.docs.length; i++) {
//           var myd = (element.docs[i].data()['mydate'].toDate());
//           var myd2 = (element.docs[i].data()['end_date'].toDate());
//           print(
//               "}++++++++++++++++++}++++++++++++}+++++++}--------- total ----------${element.docs.length}+++++");
//           print(
//               "}++++++++++++++++++}++++++++++++}++++++++++++}+++++}------  start ---$myd--------  end  :-$myd2+++++");
//           print(
//               "}+++++++++++---------------------------------------from fun--------dtmcur-------$dtmcur----------+++++");

//           if (dtmcur.isBefore(myd) && dtmcur.isAfter(myd2) ) {
//             // && (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) solve this after simple code done
//             // if (myd.isBefore(dtm) && myd2.isAfter(dtm)) {
//             print("--------dtm=$dtm \n dtm2=$dtm2}---\n  dtmcur  $dtmcur--------}++++}++ \n start = $myd ++++++\n end = $myd2++-------------  not allow ------------");
            
//                if(title=="start DateTime")dtm = null; 
//                 if(title=="end DateTime")  dtm2=null;                    
//             cureentmybool = false;
//             print("?????????????????????/////////////////////////----------------return false");
//             // return false;
//             break;
//           } else
//             print(
//                 "}++++++++}++$dtmcur}+}+++++}++${element.docs.length}++++}++$myd +++++++$myd2++------------- allow ------------");
//                 cureentmybool = true;
//           // return true;
//         }
        
//         print("}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}++++++++++++++++++");
//       });
//     }else{
//       print("nedd to chose dtm first..........");
//     }
  
   
//     return cureentmybool;
//   }
// // totaldayprice