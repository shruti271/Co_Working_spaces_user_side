import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/category_wise_detail/image_widget.dart';
import 'package:coworking_space/screen/notification/allnotification.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:coworking_space/screen/splash/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String user;
  final List<Message> messages = [];
Future<void> getdata() async {

  
   final prefs = await SharedPreferences.getInstance();
   setState(() {
     user = prefs.getString('current_login_user');
   });}
  @override
  void initState() {
    super.initState();
    // getdata();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  // print('Got a message whilst in the foreground!');
  // print('Message data: ${message.data}');

  // if (message.notification != null) {
  //   print('Message also contained a notification: ${message.notification}');
  // }
// });

    // print("${value.documentID}");

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _firebaseMessaging.configure(
      
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        print("----------------------------------onmessage----------------------");
        final notification = message['notification'];
        // showNotification(message['notification']);
        // setState(() {
        //   messages.add(Message(
              // title: notification['title'], body: notification['body']));
        // });
        Firestore.instance.collection('notification').add({
          'title':notification['title'],
          'body':notification['body'],
          'date':DateTime.now(),
          'userid':user,
        }).then((value) {
          print("----------------------------------onmessage------------------------------------------------");
        }   );
        


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
        print("onLaunch------------------------------------: $message");

        final notification = message['data'];
        // setState(() {
        //   messages.add(Message(
        //     title: '${notification['title']}',
        //     body: '${notification['body']}',
        //   ));
        // });
        Firestore.instance.collection('notification').add({
          'title':notification['title'],
          'body':notification['body'],
          'date':DateTime.now(),
          'userid':user,
        }).then((value) {
            print("----------------------------------onlaunch----------------------");
        }   );
      },

      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
  //  ListView(
        // children: messages.map(buildMessage).toList(),
      // );

  // Widget buildMessage(Message message) { Firestore.instance.collection('notification').add({
  //         'title':message.title,
  //         'body':message.body,
  //         'date':DateTime.now(),
  //         'userid':"2iUwE6GR7aOt7n58BxOJH7gz8Gc2",
  //       }).then((value) {}   );
getdata();
    return SingleChildScrollView(
      child: Column(
        children: [
          // Text(
          //   "High Rated",
          //   style: TextStyle(fontSize: 20, color: Colors.black),
          // ),
          Container(
            
            // height: 300,
            // width: double.infinity,
            child:
             StreamBuilder(
                stream: Firestore.instance
                    .collection('notification').where('userid',isEqualTo : user)
                    .orderBy('date',descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                   if (snapshot.hasError) {
          return Text('Something went wrong');
        }
                   if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator(
                    //  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                   ));
                   }
                  // if (snapshot.hasError) Text("waiting error");
                  else{
                  return Column(
                    children: List.generate(snapshot.data.documents.length, (index){
                      print(index);
                      print(">>>>>.....................>>>>>.....................>>>>>....................."+snapshot.data.documents[index].documentID);
                      return allnotification(cdata: snapshot.data.documents[index]);
                    }),
                  );
                   
                }
                }
                ),
                    )
          
        ],
      ),
    );
  }
    // void notification(Message message){
        
    // }
  }  
