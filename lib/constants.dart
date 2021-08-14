import 'package:flutter/material.dart';
import 'package:coworking_space/size_config.dart';
import 'package:geolocator/geolocator.dart';


Position pos;
int pricewisesort=0;

// class Priceway{
//   static int pricewisesort=0;
// }
// class BookinDetails{
//   // for choosinf place in toogle_bar_book.dart
// DateTime dtm;
// DateTime dtm2;

// // counting hours in bookin
//  int currentCount=0;
//  int totalhourprice=0;
// int totaldayprice=0;
// }


// category vala project mathi copy 
class ColorConstant {
  static const kFABBackColor = Color(0xFF12192b);
  static const kFilterBackColor = Color(0xfff5f7fa);
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kGreyColor = Colors.grey;
  static const kGreenColor = Colors.green;
  static const kAppColor = Colors.white60;

  static const kfullAppColor = Colors.orange;
}
//2ns page
// class House {
//   House({
//     this.id,
//     this.amount,
//     this.address,
//     this.bedrooms,
//     this.bathrooms,
//     this.squarefoot,
//     this.garages,
//     this.kitchen,
//   });

//   int amount;
//   int bedrooms;
//   int bathrooms;
//   int garages;
//   int kitchen;
//   String address;
//   double squarefoot;
//   int id;
// }

// class Constants {
//   static List<House> houseList = [
//     House(
//       id: 1,
//       amount: 1000000,
//       address: 'Jenison, MI 49428, SF',
//       bedrooms: 3,
//       bathrooms: 2,
//       squarefoot: 1.416,
//       garages: 2,
//       kitchen: 1,
//     ),
//     House(
//       id: 2,
//       amount: 2000000,
//       address: 'Delhi, MI 55555, SF',
//       bedrooms: 4,
//       bathrooms: 4,
//       squarefoot: 2.416,
//       garages: 3,
//       kitchen: 2,
//     ),
//     House(
//       id: 3,
//       amount: 3000000,
//       address: 'Mumbai, MI 49428, SF',
//       bedrooms: 5,
//       bathrooms: 2,
//       squarefoot: 3.416,
//       garages: 2,
//       kitchen: 1,
//     ),
//     House(
//       id: 4,
//       amount: 4000000,
//       address: 'Pune, MI 55555, SF',
//       bedrooms: 3,
//       bathrooms: 4,
//       squarefoot: 4.416,
//       garages: 3,
//       kitchen: 2,
//     ),
//     House(
//       id: 5,
//       amount: 5000000,
//       address: 'Rajkot, MI 49428, SF',
//       bedrooms: 4,
//       bathrooms: 2,
//       squarefoot: 5.416,
//       garages: 2,
//       kitchen: 1,
//     ),
//     House(
//       id: 6,
//       amount: 6000000,
//       address: 'Bhuj, MI 55555, SF',
//       bedrooms: 5,
//       bathrooms: 4,
//       squarefoot: 6.416,
//       garages: 3,
//       kitchen: 2,
//     ),
//   ];

//   static List<String> imageList = [
//     "imgs/house_1.png",
//     "imgs/house_2.png",
//     "imgs/house_3.png",
//     "imgs/house_4.png",
//     "imgs/house_5.png",
//     "imgs/house_6.png",
//     "imgs/house_7.png",
//   ];
// }

// ---------------------finish
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

//using all app self maded
String selectedLocation="";
// List<int> favList = List<int>();
 // ignore: deprecated_member_use
List<int> fav = List<int>();




const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
