// import 'dart:js';

import 'package:coworking_space/favourte_main_page.dart/body.dart';
// import 'package:coworking_space/help/body.dart';
import 'package:coworking_space/payment/payment_main.dart';
import 'package:coworking_space/screen/profile/help_screen/help_screen.dart';
import 'package:coworking_space/screen/profile/msgscreen.dart';
import 'package:coworking_space/screens/cart/cart_screen.dart';
import 'package:coworking_space/screens/home/home_screen.dart';
import 'package:flutter/widgets.dart';
// import 'package:coworking_space/screen/cart/cart_screen.dart';
// import 'package:coworking_space/screen/complete_profile/complete_profile_screen.dart';
// import 'package:coworking_space/screen/details/details_screen.dart';
import 'package:coworking_space/screen/forgot_password/forgot_password_screen.dart';
import 'package:coworking_space/screen/login_success/login_success_screen.dart';
// import 'package:coworking_space/screen/otp/otp_screen.dart';
import 'package:coworking_space/screen/profile/profile_screen.dart';
import 'package:coworking_space/screen/sign_in/sign_in_screen.dart';
import 'package:coworking_space/screen/splash/splash_screen.dart';
import 'book_now_cat/toggle_bar_book.dart';
import 'category_wise_detail/cat_place.dart';
import 'google_map/all_location_main_body.dart';
import 'screen/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CategoryWiseProductPage.routeName:(context)=>CategoryWiseProductPage(),
  Allmapbody.routeName:(context)=>Allmapbody(),
  Booktoggle.routeName:(context)=>Booktoggle(),
  PaymenPage.routeName:(context)=>PaymenPage(),
  MainpageOfFavourite.routeName:(context)=>MainpageOfFavourite(),
  // HelpToUseApp.routeName:(context)=>HelpToUseApp(),
  HelpScreen.routeName:(context)=>HelpScreen(),
  ChatDetailPage.routeName:(context)=>ChatDetailPage(),
};
