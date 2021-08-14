// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/category_wise_detail/car.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import '../constants.dart';



class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

// String alo;

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child,
              );
            },
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

// // ignore: must_be_immutable
// class BasicDateTimeField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   String title;
//   String id;
//   int fromtogglebar;
//   BasicDateTimeField({this.title, this.id, this.fromtogglebar});
//   bool mytaskcomeleted;

//   Future<bool> datefire(DateTime dtmcur) async {
//     // Future.delayed(Duration(seconds: 2), () async {
//     bool cureentmybool;
//     if (BookinDetails.dtm != null) {
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
//               "}++++++++++++++++++}++++++++++++}+++++++}---------$myd----------${element.docs.length}+++++");
//           print(
//               "}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}---------$myd2---------${element.docs.length}+++++");
//           print(
//               "}+++++++++++---------------------------------------------$dtmcur---------${element.docs.length}+++++");

//           if (dtmcur.isBefore(myd) && dtmcur.isAfter(myd2) ) {
//             // && (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) solve this after simple code done
//             // if (myd.isBefore(dtm) && myd2.isAfter(dtm)) {
//             print("--------dtm=$dtm}+}+---dtm2=$dtm2}----${element.docs.length}++++}++$myd +++++++$myd2++-------------  not allow ------------");
            
//                if(title=="start DateTime")BookinDetails.dtm = null; 
//                 else dtm2=null;                    
//             cureentmybool = false;
//             print("?????????????????????/////////////////////////----------------return false");
//             // return false;
//             break;
//           } else
//             print(
//                 "}++++++++}++$dtm}+}+++++}++${element.docs.length}++++}++$myd +++++++$myd2++------------- allow ------------");
//                 cureentmybool = true;
//           // return true;
//         }
        
//         print("}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}++++++++++++++++++");
//       });
//     }else{
//       print("nedd to chose dtm first..........");
//     }

//     // });
//     // mytaskcomeleted = true;
//     // return dtm;
//     return cureentmybool;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var date;
//     var time;

//     return Column(children: <Widget>[
//       // Text('Basic date & time field (${format.pattern})'),
//       Text("$title"),
//       DateTimeField(
//           format: format,
//           onShowPicker: (context, currentValue) async {
//             date = await showDatePicker(
//                 context: context,
//                 firstDate: DateTime(1900),
//                 initialDate: currentValue ?? DateTime.now(),
//                 lastDate: DateTime(2100));
//             if (date != null) {
//               // final
//               time = await showTimePicker(
//                 context: context,
//                 initialTime:
//                     TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//               );

//               // DateTime dtm=
//               if (title == "start DateTime") {
//                 BookinDetails.dtm = DateTimeField.combine(date, time);
//                 print("yes it is---srat DateTime----------------------------+++++++++++++++++++++++++++++");

//                 await datefire(BookinDetails.dtm).then((value) {
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
//                     BookinDetails.dtm = null;
//                     return BookinDetails.dtm;
//                     // ignore: dead_code
//                   } else {
//                     print(
//                         "yes it is----true---------------------------+++++++++++++++++++++++++++++");
//                     // dtm = DateTimeField.combine(date, time);
//                     // return dtm;
//                   }
//                 });
//                 return BookinDetails.dtm;
//                } else {
//                 dtm2 = DateTimeField.combine(date, time);                 
//                 print(
//                     "yes it is---end  DateTime---------------$dtm2}------$dtm}-------+++++++++++++++++++++++++++++");

//                 await datefire(dtm2).then((value) {
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
//                   }
//                 });
//                 return dtm2;
//               } //else of start date if
//               // return null;
//             }
//             return null;
//           }),
//     ]);
//   } //stateless 2nd end
// } //steless main end

// ------------------
