import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BasicDateTimeField extends StatefulWidget {
  String title;
  String id;
  int fromtogglebar;
  final Function(DateTime) onDateChanged;

  BasicDateTimeField(
      {this.title, this.id, this.fromtogglebar, @required this.onDateChanged});

  @override
  _BasicDateTimeFieldState createState() => _BasicDateTimeFieldState();
}

class _BasicDateTimeFieldState extends State<BasicDateTimeField> {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  // bool mytaskcomeleted;
  DateTime dtm;

  
  @override
  Widget build(BuildContext context) {
    var date;
    var time;

    return Column(children: <Widget>[
      // Text('Basic date & time field (${format.pattern})'),
      // Text("${widget.title}"),
      DateTimeField(
          format: format,
          decoration: InputDecoration(
            labelText: "DateTime",
            hintText: "${widget.title}",
          ),          
          // validator: (DateTime dateTime) {
          //   if (dateTime == null) {
          //     return "Date Time Required";
          //   }
          //   return null;
          // },
          onShowPicker: (context, currentValue) async {
            date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100),
            );

            if (date != null) {
              // final
              time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              // DateTime dtm=
              
            dtm = DateTimeField.combine(date, time);
                print("yes it is---Time----------------------------+++++++++++++++++++++++++++++");

                await datefireme(dtm,  widget.id).then((value) {
                  print("--------what is it?-----------------$value");

                  if (value == false) {
                    print(
                        "yes it is---false----------------------------+++++++++++++++++++++++++++++");
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Alert Dialog Box"),
                        content: Text("already booked this time.."),
                        actions: <Widget>[
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
                    dtm = null;
                    currentValue = null;
                    return dtm;
                    // ignore: dead_code
                  } else {
                    print(
                        "yes it is----true---------------------------+++++++++++++++++++++++++++++");
                    // dtm = DateTimeField.combine(date, time);
                    // return dtm;
                     widget.onDateChanged(dtm);
                return dtm;
                  }
                });
                // widget.onDateChanged(dtm);
                // return dtm;
                }
   return dtm;
          }
          ),
    ]);
  }
} //steless main end

// ------------------

Future<bool> datefireme(DateTime dtmcur, String id) async {
  
  bool cureentmybool=true;
      
    await Firestore.instance
        .collection('check')
        .where('place_id', isEqualTo: id)
        .getDocuments()
        .then((element) {
      print("-------------------------------------------------------------------id:--$id------total :----${element.documents.length}+++++");

      for (int i = 0; i < element.documents.length; i++) {
        var myd = (element.documents[i]['mydate'].toDate());
        var myd2 = (element.documents[i]['end_date'].toDate());
                
        print("----------------------------------------------------------------  start ---$myd--------  end  :-$myd2+++++");
        print("----------------------------------------------------from fun--------dtmcur-------$dtmcur----------+++++");

if ( (dtmcur.isAfter(myd) && dtmcur.isBefore(myd2)) ||  (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) ) {//today change 16 june
        // if ( (dtmcur.isBefore(myd) && dtmcur.isAfter(myd2)) ||  (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) ) {//today change 16 june
          // && (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) solve this after simple code done
          // if (myd.isBefore(dtm) && myd2.isAfter(dtm)) {
          print("dtmcur  $dtmcur------+++++++++++ start = $myd +++++++++ end = $myd2 +++++++++++++++  not allow ????????????????????????????");

          cureentmybool = false;
          print("?????????????????????/////////////////////////----------------return false");
          // return false;
          break;
        } else{
          // if(())
          print("}++++++++}++$dtmcur}+}+++++}++${element.documents.length}++++}++$myd +++++++$myd2++------------- allow ------------");
          cureentmybool = true;
        // return true;
        }
      }

      print("}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}+++++++++++outside of for loop +++++++");
    });
  

  return cureentmybool;
}

/*
DateTime date1 = DateTime.now();
System.out.println(date1);
DateTime date2 = DateTime.now().plusDays(1);
System.out.println(date2);
System.out.println(date1.isBefore(date2));     //true
System.out.println(date1.isAfter(date2));      //false
*/
// totaldayprice
// -----------------------------------+++++++++++++++?????????????????????????????????????

Future<bool> checkForDateNotBetween(DateTime dtStart,DateTime dtEnd, String id) async {
  
  bool cureentmybool=true;
      
    await Firestore.instance
        .collection('check')
        .where('place_id', isEqualTo: id)
        .getDocuments()
        .then((element) {
      print("-------------------------------------------------------------------id:--$id------total :----${element.documents.length}+++++");

      for (int i = 0; i < element.documents.length; i++) {
        var myd = (element.documents[i]['mydate'].toDate());
        var myd2 = (element.documents[i]['end_date'].toDate());
                
        print("----------------------------------------------------------------  start ---$myd--------  end  :-$myd2+++++");
        print("----------------------------------------------------from fun--------dtmcur-------$dtStart----------+++++");
//dtmcur.isAfter(myd) && dtmcur.isBefore(myd2))
        // if ((myd.isBefore(dtStart) && myd2.isBefore(dtStart))	||	(myd.isAfter(dtEnd) && myd2.isAfter(dtEnd))) {
          if ((dtStart.isBefore(myd) && dtEnd.isBefore(myd))	||	(dtEnd.isAfter(myd2) && dtStart.isAfter(myd2))) {
          // && (dtmcur.compareTo(myd)==0 || dtmcur.compareTo(myd2)==0) solve this after simple code done
          // if (myd.isBefore(dtm) && myd2.isAfter(dtm)) {                                       
          print("dtmcur  $dtStart------+++++++++++ start = $myd +++++++++ end = $myd2 +++++++++++++++  not allow ????????????????????????????");

          cureentmybool = false;
          // print("?????????????????????/////////////////////////----------------return false ----------not allowed");
          // return false;
          break;
        } else
          print("}++++++++}++$dtStart}+}+++++}++${element.documents.length}++++}++$myd +++++++$myd2++------------- allow ------------");
          cureentmybool = true;
        // return true;
      }

      print("}++++++++++++++++++}++++++++++++}++++++++++++}++++++++++++}+++++++++++outside of for loop +++++++");
    });
  

  return cureentmybool;
}
// totaldayprice
// basic introductino for condition
// a.isafter(b)

// a ni pachi b

// a.isBefore(b)
// a ni phela b


// fds ni mys ni pela  dtStart.isBefore(myd)
// fde ni mys ni pela	dtEnd.isBefore(myd2)

// fds ni mys2 ni pechi
// fde ni mys2 ni pechi

// (myd.isBefore(dtStart) && myd.isBefore(dtEnd))	||	(myd2.isAfter(dtStart) && myd2.isAfter(dtEnd))
