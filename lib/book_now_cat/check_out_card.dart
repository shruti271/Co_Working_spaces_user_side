/*
razor pay make account:::
key id : rzp_test_Y0aMjP3yK2Z2CG
key secret :GtHMueAJMmBh26p8MwA9zUie


from copy: razopay payment gateway:

key_id	key_secret
rzp_test_Y0aMjP3yK2Z2CG	
GtHMueAJMmBh26p8MwA9zUie

https://dashboard.razorpay.com/?next=app/dashboard#/access/signin
em: 6@g.com
pass:S..123


https://razorpay.com/docs/payment-gateway/flutter-integration/
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space/components/default_button.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutCard extends StatefulWidget {
  CheckoutCard(
      {@required this.paymentforbooking,
      @required this.sDate,
      @required this.eDate,
      @required this.placeId});

  final int paymentforbooking;
  // final String orderId;
  // final String paymentId;
  final String placeId;
  final DateTime sDate;
  final DateTime eDate;
  // const CheckoutCard({
  //   Key key,
  // }) : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  //user login or not check function
  String user,email,mobileno,username,spacename;
Future<void> getdata() async {

  
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     user = prefs.getString('current_login_user');
   });
 

  email=prefs.getString('current_login_user_email');
  mobileno=prefs.getString('current_login_user_phonenumber');
  username=prefs.getString('current_login_user_name');
//  prefs.get('current_login_user');
 print("??????????????????"+user+email+mobileno);
}
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Razorpay razorpay;
  double rate = 0;
  double totalreviewuser = 0;

  // TextEditingController textEditingController = new TextEditingController();
  FocusNode textFocusController = FocusNode();
  var msg;

  void storeindatabase(String paymentId, String orderId) {
    Firestore.instance.collection("check").add({
      'mydate': widget.sDate,
      'end_date': widget.eDate,
      'total_payment': widget.paymentforbooking,
      'payment_id': paymentId,
      // 'booking_id':orderId,
      'book_date': DateTime.now(),
      'place_id': widget.placeId,
      'user_id': user
    }).then((value) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("give review to place"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
            child: RatingBar(
              initialRating: 3.5,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
              ratingWidget: RatingWidget(
                full: Icon(Icons.star),
                half: Icon(Icons.star_half),
                empty: Icon(Icons.star_border),
              ),
              //  itemBuilder: (context, _) => Icon(
              //    Icons.star,
              //    color: Colors.amber,
              //  ),
              updateOnDrag: true,
              onRatingUpdate: (rating) async {
                print(rating);
                setState(() {
                  rate = rating;
                });
              },
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () async {
                await Firestore.instance.collection('rate_place').add({
                  'place_id': widget.placeId,
                  'rate': rate,
                  'user_id': user
                });
                double finalrate = 0;
                double totalreviewuser = 0;
                double div = 0;
                await Firestore.instance
                    .collection('rate_place')
                    .where('place_id', isEqualTo: widget.placeId)
                    .getDocuments()
                    .then((value) {
                  value.documents.forEach((element) {
                    finalrate = finalrate + element.data['rate'];
                    print(element.data['rate'].toString() +
                        "?????????????????????????");
                    totalreviewuser = totalreviewuser + 1;
                  });
                  div = finalrate / totalreviewuser;
                  print(finalrate.toString() +
                      "|||||||||||||||||||{{{{{{{{{{{" +
                      div.toString() +
                      "{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}" +
                      totalreviewuser.toString());
                }).then((value) async {
                  await Firestore.instance
                      .collection('places')
                      .document(widget.placeId)
                      .updateData({'rating': div}).then((value) {
                    div = 0;
                    totalreviewuser = 0;
                    finalrate = 0;
                  });
                });
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      ).catchError((onError) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("payment alert"),
            content: Text("error in payment ! "),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () async {
                  print(
                      "????????????????????????????????????" + rate.toString());
                  print(widget.placeId);
                  print("???????????????//////'''''''''''");
                  await Firestore.instance
                      .collection('places')
                      .document(widget.placeId)
                      .updateData({'rating': rate}).then((value) {
                    Navigator.of(ctx).pop();
                  });
                },
                child: Text("okay"),
              ),
            ],
          ),
        );
      }); //showdialog box
    }); //catcherror
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_Y0aMjP3yK2Z2CG",
      "amount": (widget.paymentforbooking) * 100, // Convert Paisa to Rupees
      "name": username,
      "description": "name of co working space",
      "timeout": "250",
      "theme.color": "#d08216",
      "currency": "INR",
      "prefill": {"contact": mobileno, "email": email},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print("Pament success");

    storeindatabase(response.paymentId, response.orderId);

    msg = "SUCCESS: " + response.paymentId;

    // response.
    showToast(msg);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    msg = "ERROR: " +
        response.code.toString() +
        " - " +
        jsonDecode(response.message)['error']['description'];
    showToast(msg);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    msg = "EXTERNAL_WALLET: " + response.walletName;
    showToast(msg);
  }

  showToast(msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey.withOpacity(0.1),
      textColor: Colors.black54,
    );
  }

  @override
  void initState() {
    super.initState();
getdata();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);

    // notification

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // String title,body;
        final notification = message['notification'];
        setState(() {
          // messages.add(Message(title: notification['title'], body: notification['body']));//our list
           Firestore.instance.collection("userdetails").document(widget.placeId).get().then((value) {
  //  value.data.document['firstname'];
  setState(() {
    spacename=value.data['spacename'];
    print(spacename);
    print("????????????????????????????????????");
  });
 });
          Firestore.instance.collection('notification').add({
            // 'title': "your payment suceesfully done",
            'title': "Payment Suceesfull",
            // 'body':notification['body']+"${widget.paymentforbooking}",
            // 'body': "your payment of ${widget.paymentforbooking} RS./- for ${notification['body']} space on ${ widget.sDate} to ${widget.eDate}" + notification['body'],
            'body': "your payment of ${widget.paymentforbooking} RS./- for ${notification['body']} space on ${ widget.sDate} to ${widget.eDate} is done",
            // 'body' : "your payment of 400 RS./ your payment of 400 RS/- for solitaire space on 27-7-2021 12:30:00 to 27-7-2021 2:30:00 is done",
            'date': DateTime.now(),
            'userid': user,
          }).then((value) {});
        });

        //  Firestore.instance.collection('notification').add({
        //       'title':title,
        //       'body':body,

        //     }).then((value) {}   );
      },

      // onMessage.listen(Map<String, dynamic> message) {
      //     print('Got a message whilst in the foreground!');
      //     print('Message data: ${message.data}');

      //     if (message.notification != null) {
      //       print('Message also contained a notification: ${message.notification}');
      //     }
// });
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          // messages.add(Message(
          //   title: '${notification['title']}',
          //   body: '${notification['body']}',
          // ));

          Firestore.instance.collection('notification').add({
            'title': "your payment suceesfully done",
            'body': "your payment of ${widget.paymentforbooking} RS./- for $spacename space on ${ widget.sDate} to ${widget.eDate}" + notification['body'],
            'date': DateTime.now(),
            'userid': user,
          }).then((value) {});
        });
      },

      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    // CartBox curCart = Provider.of<CartBox>(context,listen: false);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(50),
        horizontal: getProportionateScreenWidth(50),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -20),
            blurRadius: 10,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: getProportionateScreenWidth(190),
          child: DefaultButton(
            text: "Check Out",
            press: () {
              openCheckout();
            },
          ),
        ),
      ),
    );
  }
}
