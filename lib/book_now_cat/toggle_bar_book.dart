import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/book_now_cat/check_out_card.dart';
import 'package:flutter/material.dart';
// import '../constants.dart';
import 'calandar_picker_fun.dart';

// -------------------------+++++++++++++++++++++                 MAIN         ++++==?????????????????????????????/

class Booktoggle extends StatefulWidget {
  static String routeName = "/tooglebook";

  // final DocumentSnapshot info;
  // Booktoggle({this.info});
  @override
  _BooktoggleState createState() => _BooktoggleState();
}

class _BooktoggleState extends State<Booktoggle> {
  int myoption ;
  Color hourcolor = Colors.cyan;
  Color daycolor = Colors.grey;

  int totalhourprice = 1;
  int totaldayprice = 1;
  int currentCount = 0;
  int difindays = 0;

  DateTime myfinalDateforStart;
  DateTime myfinalDateforEnd;
  DateTime myfinalDateforHoursEnd;

void setfirstimemyoption(DocumentSnapshot cdata){
if(cdata.data.containsKey('hour_price'))myoption=0;
else if(cdata.data.containsKey('day_price'))myoption=1;

}

  @override
  void initState() {
    super.initState();
    // setfirstimemyoption();
    // datefire();
  }

  void uchooseme(int me) {
    setState(() {
      myoption = me;
    });
  }

//for hour price counting // -------------------------+++++++++++++++++++++          counting       MAIN         ++++==?????????????????????????????/
  Widget mycounterHours(int currenthrpr, String id) {
    Future<void> minus() async {
      if (currentCount != 0) {
        setState(() {
          currentCount--;
          myfinalDateforHoursEnd =
              myfinalDateforStart.subtract(Duration(hours: 1));
          totalhourprice = currentCount * currenthrpr;
        });

        await datefireme(myfinalDateforHoursEnd, id).then((value) {
          if (value == false) {
            print("this hour is not allowed----------------------------for hours---------------????????????????????????????????????????");
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Alert for booking"),
                content: Text("You can't take more hores now "),
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
            setState(() {
              currentCount--;
              myfinalDateforHoursEnd =
                  myfinalDateforStart.subtract(new Duration(hours: 1));
            });
          } else {
            ckeckforBetweenValidation(id,myfinalDateforHoursEnd);
            setState(() {
              totalhourprice = currentCount * currenthrpr;
            });
          }
        });
      }
    }

    void add(DateTime cdtm) async {
      setState(() {
        // currentCount++;
        myfinalDateforHoursEnd = cdtm;
        myfinalDateforHoursEnd =myfinalDateforStart.add(new Duration(hours: currentCount));
        print(
            "this hour is -----end date------ $myfinalDateforHoursEnd         ----------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        // totalhourprice=currentCount * currenthrpr;
      });

      await datefireme(myfinalDateforHoursEnd, id).then((value) {
        if (value == false) {
          print(
              "this hour is not allowed----------------------------for hours---------------????????????????????????????????????????");
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Alert for booking"),
              content: Text("You can't take more hores now "),
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
          setState(() {
            currentCount--;
            myfinalDateforHoursEnd =
                myfinalDateforStart.subtract(new Duration(hours: 1));
          });
        } else {
          setState(() {
            totalhourprice = currentCount * currenthrpr;
          });
        }

      });
   
    }

    return Container(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FloatingActionButton(
                  heroTag: "incbtn",
                  onPressed: () {
                    setState(() {
                      currentCount++;
                    });
                    add(myfinalDateforStart);
                  },
                  child: new Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                ),
                new Text('$currentCount', style: new TextStyle(fontSize: 60.0)),
                new FloatingActionButton(
                  heroTag: "minbtn",
                  onPressed: minus,
                  child: new Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          (currentCount != 0)
              ? Text("1 hour=$currenthrpr  $currentCount Hours=$totalhourprice",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                                  )
              : Text(""),
        ],
      ),
    );
  }

// is date avilable or not checkout function
  void ckeckforBetweenValidation( String id , DateTime funmyfinalDateforEnd ) async {
    await checkForDateNotBetween(myfinalDateforStart, funmyfinalDateforEnd, id)
        .then((value) {
      if (value ==true) {
        print(
            "this hour is not allowed----------------------------for hours---------------????????????????????????????????????????");
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Alert for booking"),
            content: Text(
                "You need to change your time bcz in between already booked"),
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
      }
    });
  }

// set price fo day value
  void settotalpriceforday(int price) {
    setState(() {
      difindays = myfinalDateforEnd.difference(myfinalDateforStart).inDays;
      print("---------------$price---------------$difindays");
      totaldayprice = difindays * price;
      print("------------------------------$totaldayprice");
    });
  }


// main state code
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final DocumentSnapshot cdata = arguments['placedata'];
    if(myoption==null) setfirstimemyoption(cdata);
    int fromtogglebar;    //for datetimefiel toggle bar

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: (myoption==0)?CheckoutCard(paymentforbooking:totalhourprice,sDate: myfinalDateforStart,eDate: myfinalDateforHoursEnd,placeId: cdata.documentID,):
      CheckoutCard(paymentforbooking:totaldayprice,sDate: myfinalDateforStart,eDate: myfinalDateforHoursEnd,placeId: cdata.documentID),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: (cdata.data.containsKey('spacename'))
                      ? Text(
                          "${cdata['spacename']}",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        )
                      : Text(""),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ToggleSwitch(
                      //   minWidth: 120.0,
                      //   cornerRadius: 20.0,
                      //   activeBgColor: Colors.cyan,
                      //   activeFgColor: Colors.white,
                      //   inactiveBgColor: Colors.grey,
                      //   inactiveFgColor: Colors.white,
                      //   labels: ['Hours', 'Days'],
                      //   onToggle: (index) {
                      //     print('switched to: $index');
                      //     //  myoption=index;
                      //     uchooseme(index);
                      //   },
                      // ),

// day hor toggle button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "incrementhourwidget",
                            child: (cdata.data.containsKey('hour_price'))
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: (myoption == 0)
                                          ? Colors.cyan
                                          : Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          if (myoption == 1) {
                                            myoption = 0;
                                            print(myoption);
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                          }
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Text(
                                        "Hours",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            letterSpacing: 1.4,
                                            fontFamily: "arial"),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, bottom: 5, right: 5),
                                    // ),
                                  )
                                : Container(),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Hero(
                            tag: "incrementdaywidget",
                            child: (cdata.data.containsKey('day_price'))
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: (myoption == 1)
                                          ? Colors.cyan
                                          : Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          if (myoption == 0) {
                                            // print("my color 1",);
                                            // if(myoption==1){
                                            // daycolor=Colors.grey;
                                            // hourcolor=Colors.cyan;
                                            myoption = 1;
                                            print(myoption);
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                            print(":::::::::::::::::::::::::::::::::::::::::::::");
                                            // }
                                          }
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Text(
                                        "Days",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            letterSpacing: 1.4,
                                            fontFamily: "arial"),
                                      ),
                                    ),
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, bottom: 5, right: 5),
                                    // ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
//start date filed
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: BasicDateTimeField(
                                  title: "start DateTime",
                                  id: cdata.documentID,
                                  fromtogglebar: fromtogglebar,
                                  onDateChanged: (DateTime val) {
                                    print(
                                        "$val ---------------------------!!!!!!!!!!!!!!!@@@@@@@@@@@@@>>>>>>>>>>>>>>>>>.");
                                    setState(() {
                                      myfinalDateforStart = val;
                                    });
                                    print(
                                        "$myfinalDateforStart --------------myfinalDateforStart-------------!!!!!!!!!!!!!!!@@@@@@@@@@@@@>>>>>>>>>>>>>>>>>.");
                                    // setdayprice();
                                    (myfinalDateforStart != null &&
                                            myfinalDateforEnd != null)
                                        ? settotalpriceforday(
                                            cdata['day_price'])
                                        : print("can access date");
                                    (myfinalDateforStart != null &&
                                            myfinalDateforHoursEnd != null)
                                        ? ckeckforBetweenValidation(
                                            cdata.documentID, myfinalDateforHoursEnd)
                                        : print("can access date");
                                  })),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
//end date field
                      (myoption == 1)
                          ? Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                    child: BasicDateTimeField(
                                        title: "end DateTime",
                                        id: cdata.documentID,
                                        fromtogglebar: fromtogglebar,
                                        onDateChanged: (DateTime val) {
                                          print(
                                              "$val ---------------------------!!!!!!!!!!!!!!!@@@@@@@@@@@@@>>>>>>>>>>>>>>>>>.");
                                          setState(() {
                                            myfinalDateforEnd = val;
                                          });
                                          print(
                                              "$myfinalDateforStart --------------myfinalDateforStart-------------!!!!!!!!!!!!!!!@@@@@@@@@@@@@>>>>>>>>>>>>>>>>>.");
                                          // setdayprice();
                                          (myfinalDateforStart != null &&
                                                  myfinalDateforEnd != null)
                                              ? settotalpriceforday(
                                                  cdata['day_price'])
                                              : print("can access date");
                                          (myfinalDateforStart != null &&
                                                  myfinalDateforEnd != null)
                                              ? ckeckforBetweenValidation(
                                                  cdata.documentID, myfinalDateforEnd)
                                              : print("can access date");
                                        })),
                              ],
                            )
                          : Container(),

                      SizedBox(
                        height: 20,
                      ),

                      (myoption == 0)
                          ? mycounterHours(cdata['hour_price'], cdata.documentID)
                          : Container(),

                      (myoption == 1 && difindays != 0)
                          ? Text(
                              "Price: $totaldayprice",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          : Text("")
                      // Text("$totaldayprice"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
