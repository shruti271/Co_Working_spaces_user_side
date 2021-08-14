import 'package:flutter/material.dart';
import 'package:coworking_space/constants.dart';
import 'package:coworking_space/screen/sign_in/sign_in_screen.dart';
import 'package:coworking_space/screen/sign_up/sign_up_screen.dart';
import 'package:coworking_space/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';
// import 'package:connectivity/connectivity.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "The Best Place to Find Workspaces",
      "image": "assets/images/image2.png"
    },
    {
      "text": "Our Spaces Are Safe & Fully Loaded",
      "image": "assets/images/image3.jpg"
    },
    {
      "text": "Day Offices for All Team Sizes",
      "image": "assets/images/image4.webp"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // Spacer(flex: 1),
                      // ignore: deprecated_member_use
                      // RaisedButton(child:Text("Check internet"),onPressed: _checkinternet),
                    SizedBox(
                         height: 40,
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                    ),
                    SizedBox(height: 3),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text(              
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pushNamed(LoginScreen.routeName);
                           Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                    
                    ]
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // _checkinternet() async {
  //   var result = await Connectivity().checkConnectivity();
  //    if(result == ConnectivityResult.none)
  //    {
  //         showDialog(
  //               context: context,
  //               builder: (ctx) => AlertDialog(
  //                 title: Text("Alert Dialog Box"),
  //                 content: Text("You have raised a Alert Dialog Box"),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     onPressed: () {
  //                       Navigator.of(ctx).pop();
  //                     },
  //                     child: Text("okay"),
  //                   ),
  //                 ],
  //               ),
  //             );
  //    }
  //    else if(result == ConnectivityResult.mobile)
  //    {
  //         showDialog(
  //               context: context,
  //               builder: (ctx) => AlertDialog(
  //                 title: Text("Alert Dialog Box"),
  //                 content: Text("You have raised a Alert Dialog Box"),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                     onPressed: () {
  //                       Navigator.of(ctx).pop();
  //                     },
  //                     child: Text("okay"),
  //                   ),
  //                 ],
  //               ),
  //             );
  //    }
  // }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
