import 'package:flutter/material.dart';

double iconSize = 30;

class SpaceInfo {
  final int id;
  List<String> img=[];    
  final String spacename;
  final double price;
  List<Map<Icon, String>> amenities;
  // List<Map<Icon, String>> spaceinfo;
  // Features spaces;
  double placeofcity;
  String overview;
  String address;
  int rating;

  SpaceInfo({
    // @required this.spaces,
    @required this.amenities,
    // @required this.spaceinfo,
    @required this.id,
    @required this.spacename,
    @required this.price,
    @required this.img,
    // @required this.placeofcity,
    // @required this.overview,
    @required this.address,
    // @required this.rating,
  });
}
class Features{
  List<Map<Icon, String>> amenities;
  List<Map<Icon, String>> spaceinfo;

  int totalList=2;

  Features({   
    @required this.amenities,
    @required this.spaceinfo,
  });
}


class Pacenotifier with ChangeNotifier{

  List<SpaceInfo> _allSpace=[
    SpaceInfo(
  id: 1,
  spacename: 'whitelion',
  // spaces: 
    //  Features(
        amenities: [
          {Icon(Icons.print_sharp, size: iconSize): "printer"},
          {Icon(Icons.ac_unit_rounded, size: iconSize): "A/C"},
        ],
        // spaceinfo: [
        //   {Icon(Icons.set_meal, size: iconSize): "seat"},
        //   {Icon(Icons.wifi, size: iconSize): "wifi"}
        //   ],
          // ),  
  img: ["imgs/o6.jpg","imgs/o7.jpg","imgs/o8.jpg"],     
  address: 'c-67,utran',
  price: 200,

),
SpaceInfo(
  id: 2,
  spacename: 'truline',
  // spaces: 
  //    Features(
        amenities: [
          {Icon(Icons.print_sharp, size: iconSize): "printer"},
          {Icon(Icons.ac_unit_rounded, size: iconSize): "A/C"},
        ],
        // spaceinfo: [
        //   {Icon(Icons.set_meal, size: iconSize): "seat"},
        //   {Icon(Icons.wifi, size: iconSize): "wifi"}
        //   ],
          // ),  
  img: ["imgs/o7.jpg","imgs/o6.jpg","imgs/o8.jpg"],     
  address: 't-5,rahul raj mall',

  price: 400,

)
  ];
 
      List<SpaceInfo> get spaceInfo {
    return [..._allSpace];
  }

  int get itemCount {
    return _allSpace.length;
  }

    SpaceInfo findById(int id) {
    return _allSpace.firstWhere((pdt) => pdt.id == id);
  }

}

// CarList carList = CarList(cars: [
//   Car(companyName: "Chevrolet", carName: "Corvette", price: 2100, imgList: [
//     "corvette_front.png",
//     "corvette_back.png",
//     "interior1.png",
//     "interior2.png",
//     "corvette_front2.png",
//   ], offerDetails: [
//     {Icon(Icons.bluetooth, size: iconSize): "Automatic"},
//     {Icon(Icons.airline_seat_individual_suite, size: iconSize): "4 seats"},
//     {Icon(Icons.pin_drop, size: iconSize): "6.4L"},
//     {Icon(Icons.shutter_speed, size: iconSize): "5HP"},
//     {Icon(Icons.invert_colors, size: iconSize): "Variant Colours"},
//   ], specifications: [
//     {
//       Icon(Icons.av_timer, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
//     },
//     {
//       Icon(Icons.power, size: iconSize): {"Engine(upto)": "3996 cc"}
//     },
//     {
//       Icon(Icons.assignment_late, size: iconSize): {"BHP": "700"}
//     },
//     {
//       Icon(Icons.account_balance_wallet, size: iconSize): {
//         "More Specs": "14.2 kmpl"
//       }
//     },
//     {
//       Icon(Icons.cached, size: iconSize): {"More Specs": "14.2 kmpl"}
//     },
//   ], features: [
//     {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
//     {Icon(Icons.usb, size: iconSize): "USB Port"},
//     {Icon(Icons.power_settings_new, size: iconSize): "Keyless"},
//     {Icon(Icons.android, size: iconSize): "Android Auto"},
//     {Icon(Icons.ac_unit, size: iconSize): "AC"},
//   ]),
  
//   Car(companyName: "Lamborghini", carName: "Aventador", price: 3000, imgList: [
//     "lambo_front.png",
//     "interior_lambo.png",
//     "lambo_back.png",
//   ], offerDetails: [
//     {Icon(Icons.bluetooth, size: iconSize): "Automatic"},
//     {Icon(Icons.bluetooth, size: iconSize): "4 seats"},
//     {Icon(Icons.bluetooth, size: iconSize): "6.4L"},
//     {Icon(Icons.bluetooth, size: iconSize): "5HP"},
//     {Icon(Icons.bluetooth, size: iconSize): "Variant Colours"},
//   ], specifications: [
//     {
//       Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
//     },
//     {
//       Icon(Icons.bluetooth, size: iconSize): {"Engine(upto)": "3996 cc"}
//     },
//     {
//       Icon(Icons.bluetooth, size: iconSize): {"BHP": "700"}
//     },
//     {
//       Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
//     },
//     {
//       Icon(Icons.bluetooth, size: iconSize): {"Milegp(upto)": "14.2 kmpl"}
//     },
//   ], features: [
//     {Icon(Icons.bluetooth, size: iconSize): "Bluetooth"},
//     {Icon(Icons.bluetooth, size: iconSize): "USB Port"},
//     {Icon(Icons.bluetooth, size: iconSize): "Keyless"},
//     {Icon(Icons.bluetooth, size: iconSize): "Android Auto"},
//     {Icon(Icons.bluetooth, size: iconSize): "AC"},
//   ])
// ]);

// class AllProduct with ChangeNotifier{
//   Map<String,CarList> _allcar;

//     Map<String, CarList> get allcar {
//     return {..._allcar};
//   }

//   int get procount {
//     return _allcar.length;
//   }


// }
// class CarList {
//   List<Car> cars;

//   CarList({
//     @required this.cars,
//   });
// }

// class Car {
//   String companyName;
//   String carName;
//   int price;
//   List<String> imgList;
//   List<Map<Icon, String>> offerDetails;
//   List<Map<Icon, String>> features;
//   List<Map<Icon, Map<String, String>>> specifications;

//   Car({
//     @required this.companyName,
//     @required this.carName,
//     @required this.price,
//     @required this.imgList,
//     @required this.offerDetails,
//     @required this.features,
//     @required this.specifications,
//   });
// }

// -----------co working space
// SpaceInfo allspacelist = SpaceInfo(
//   id: 1,
//   spacename: 'red and white',
//   spaces: 
//      Features(
//         amenities: [
//           {Icon(Icons.print_sharp, size: iconSize): "printer"},
//           {Icon(Icons.ac_unit_rounded, size: iconSize): "A/C"},
//         ],
//         spaceinfo: [
//           {Icon(Icons.set_meal, size: iconSize): "seat"},
//           {Icon(Icons.wifi, size: iconSize): "wifi"}
//           ]
//           ),  
//   img: ["imgs/o6.jpg","imgs/o7.jpg","imgs/o8.jpg"],     
//   price: 200,

// );

