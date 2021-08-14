import 'package:coworking_space/constants.dart';
// import 'package:coworking_space/screen/profile/components/privacy.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'edit_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            //  color: kPrimaryColor,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            // buildAccountOptionRowpassword(context, "Change password"),
            // buildAccountOptionRow(context, "Social"),
            // buildAccountOptionRowlanguage(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            buildAccountOptionRowcontact(context, "Contact us"),
            SizedBox(
              height: 40,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.volume_up,
            //       color: Colors.green,
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     Text(
            //       "Notifications",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            // Divider(
            //   height: 15,
            //   thickness: 2,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // buildNotificationOptionRow("New for you", true),
            // buildNotificationOptionRow("Account activity", true),
            // buildNotificationOptionRow("Opportunity", false),
            // SizedBox(
            //   height: 50,
            // ),
            // Center(
            //   child: OutlineButton(
            //     padding: EdgeInsets.symmetric(horizontal: 40),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(20)),
            //     onPressed: () {},
            //     child: Text("SIGN OUT",
            //         style: TextStyle(
            //             fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRowpassword(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your current Password",
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your New Password",
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your New Confirm Password",
                      ),
                    ),
                  ],
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(" Close ")),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(" Apply ")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              //  color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRowlanguage(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("English"),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Gujarati"),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(" Close ")),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(" Apply ")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              // color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildAccountOptionRow(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Text(" Privacy and security"),
                  Text(
                    'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”)',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Personally identifiable information may include, but is not limited to: Email address , First name and last name , Phone number , address , Cookies and Usage DataWe may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                ],
              ),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(" Close ")),
                // ignore: deprecated_member_use
                // FlatButton(
                //     onPressed: () {
                //       BuildPrivcy();
                //     },
                //     child: Text(" Apply ")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            //  color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}

GestureDetector buildAccountOptionRowcontact(
    BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  // Text(" Conatct us "),
                  Row(children: [
                    Text("+ 91 9876543210"),
                    IconButton(onPressed: () async {
                              const url = 'tel:9876543210';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                // throw 'Could not launch $url';
                              }            
                    }, icon: Icon(Icons.call))
                  ],),
                  SizedBox(
                    height: 10,
                  ),
                 
                  Row(
                    children: [
                      Text("shrutiitaliya6@gmail.com"),
                       IconButton(onPressed: ()async{
                    await launch("mailto:shrutiitaliya6@gmail.com?subject=Query for admin");
                  }, icon: Icon(Icons.email)),
                    ],
                  )
                ],
              ),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(" Close ")),
                // ignore: deprecated_member_use
                // FlatButton(
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //     child: Text(" Apply ")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            //  color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}
