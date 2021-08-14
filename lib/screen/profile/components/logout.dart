// import 'package:coworking_space/components/default_button.dart';
// import 'package:coworking_space/constants.dart';
// import 'package:coworking_space/screen/splash/splash_screen.dart';
// import 'package:flutter/material.dart';
// // import 'package:coworking_space/screens/splash/splash_screen.dart';

// class LogOut extends StatelessWidget {
//   const LogOut({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Log out",
//           style: TextStyle(color: kPrimaryColor),
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: Center(
//                     child: DefaultButton(
//                         text: "Log out",
//                         press: () {
//                           // Navigator.pushNamed(context, SplashScreen.routeName);
//                           showDialog<String>(
//                             context: context,
//                             builder: (BuildContext context) => AlertDialog(
//                               title: const Text('Log Out Alert'),
//                               content: const Text('Are you sure for log out?'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   onPressed: () =>
//                                       Navigator.pop(context, 'Cancel'),
//                                   child: const Text('Cancel'),
//                                 ),
//                                 TextButton(
//                                   onPressed: () => Navigator.pushNamed(
//                                       context, SplashScreen.routeName),
//                                   child: const Text('OK'),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // IconButton(
// //               icon: Icon(Icons.close),

// //               onPressed: () {
// //                 _auth.signOut();
// //                 Navigator.pop(context);
// //               }),


import 'package:coworking_space/components/default_button.dart';
import 'package:coworking_space/constants.dart';
import 'package:coworking_space/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
// import 'package:coworking_space/screens/splash/splash_screen.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Log out",
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: DefaultButton(
                        text: "Log out",
                        press: () {
                          // Navigator.pushNamed(context, SplashScreen.routeName);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Log Out Alert'),
                              content: const Text('Are you sure for log out?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, SplashScreen.routeName),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// IconButton(
//               icon: Icon(Icons.close),

//               onPressed: () {
//                 _auth.signOut();
//                 Navigator.pop(context);
//               }),
