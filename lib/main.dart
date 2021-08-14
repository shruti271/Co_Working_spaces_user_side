// import 'package:coworking_space/screen/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:coworking_space/routes.dart';
// import 'package:coworking_space/theme.dart';

// void main() {
//   runApp(MyApp());
// }

// // Future<void> main() async {
// // WidgetsFlutterBinding.ensureInitialized();
// // await Firebase.initializeApp();
// // runApp(MyApp());
// // }
// // 
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
     
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: theme(),
//       // home: SplashScreen(),
//       // We use routeName so that we dont need to remember the name
//       initialRoute: SplashScreen.routeName,
//       routes: routes,
//     );
//   }
// }
// ----------------------------this my main page


// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/screen/splash/splash_screen.dart';
import 'package:coworking_space/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:coworking_space/category_wise_detail/car.dart';
// import 'package:coworking_space/screens/home/home_screen.dart';
import 'package:coworking_space/routes.dart';
import 'package:coworking_space/theme.dart';
// import 'package:provider/provider.dart';
// import 'category_wise_detail/category.dart';
// import 'package:firebase_core/firebase_core.dart' ;

import 'location_access_permision.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Init firestore and geoFlutterFire

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // final prefs = await SharedPreferences.getInstance();
//  String cuser = prefs.getString('current_login_user');
//  print(cuser);

 // ignore: unused_local_variable
 final prefs = await SharedPreferences.getInstance().then((value){
     user = value.getString('current_login_user');
     runApp(MyApp(cuser:user));
   });
   CircularProgressIndicator();
     
  
}
String user ;
// Future<void> getdata() async {
//    final prefs = await SharedPreferences.getInstance().then((value){
//      user = value.getString('current_login_user');
//    });
   
//    Future.delayed(Duration(seconds: 1), () async {
//       user = prefs.getString('current_login_user');
//  print(user);
//  print(">>>>>>>>>>>>>>>>??????????????????//////////");
//    });

// //  print("??????????????????"+user);
// }
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String cuser;
  MyApp({this.cuser});
  @override
  Widget build(BuildContext context) {
    checkLocationServicesInDevice();
    // getdata();
    // print(user.isEmpty );
    // print("??????????????????????");
    return  
  
// Future.delayed(Duration(seconds: 1), () async {
       MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home:(cuser == null || cuser == "")
        ? SplashScreen():
          HomeScreen(),           
                                           
        // initialRoute: SplashScreen.routeName,//last ma reove this comment
        routes: routes,
        // routes: {
//           DetailPage.routeName: (ctx) => DetailPage(),
//           CartScreen.routeName: (ctx) => CartScreen(),
//         },
    );
  }
}











// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
//   print(message.data);
//   flutterLocalNotificationsPlugin.show(
//       message.data.hashCode,
//       message.data['title'],
//       message.data['body'],
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channel.description,
//         ),
//       ));
// }

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String token;
//   List subscribed = [];
//   List topics = [
//     'Samsung',
//     'Apple',
//     'Huawei',
//     'Nokia',
//     'Sony',
//     'HTC',
//     'Lenovo'
//   ];
//   @override
//   void initState() {
//     super.initState();
//     var initialzationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettings =
//         InitializationSettings(android: initialzationSettingsAndroid);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification notification = message.notification;
//       AndroidNotification android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channel.description,
//                 icon: android?.smallIcon,
//               ),
//             ));
//       }
//     });
//     getToken();
//     getTopics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('appbar'),
//           ),
//           body: ListView.builder(
//             itemCount: topics.length,
//             itemBuilder: (context, index) => ListTile(
//               title: Text(topics[index]),
//               trailing: subscribed.contains(topics[index])
//                   ? ElevatedButton(
//                       onPressed: () async {
//                         await FirebaseMessaging.instance
//                             .unsubscribeFromTopic(topics[index]);
//                         await FirebaseFirestore.instance
//                             .collection('topics')
//                             .doc(token)
//                             .update({topics[index]: FieldValue.delete()});
//                         setState(() {
//                           subscribed.remove(topics[index]);
//                         });
//                       },
//                       child: Text('unsubscribe'),
//                     )
//                   : ElevatedButton(
//                       onPressed: () async {
//                         await FirebaseMessaging.instance
//                             .subscribeToTopic(topics[index]);

//                         await FirebaseFirestore.instance
//                             .collection('topics')
//                             .doc(token)
//                             .set({topics[index]: 'subscribe'},
//                                 SetOptions(merge: true));
//                         setState(() {
//                           subscribed.add(topics[index]);
//                         });
//                       },
//                       child: Text('subscribe')),
//             ),
//           )),
//     );
//   }

//   getToken() async {
//     token = await FirebaseMessaging.instance.getToken();
//     setState(() {
//       token = token;
//     });
//     print(token);
//   }

//   getTopics() async {
//     await FirebaseFirestore.instance
//         .collection('topics')
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               if (token == element.id) {
//                 subscribed = element.data().keys.toList();
//               }
//             }));

//     setState(() {
//       subscribed = subscribed;
//     });
//   }
// }