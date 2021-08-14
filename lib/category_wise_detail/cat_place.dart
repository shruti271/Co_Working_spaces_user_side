import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/category_wise_detail/switch_button.dart';
import 'package:coworking_space/screen/profile/profile_screen.dart';
import 'package:coworking_space/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import 'floating_widget.dart';
import 'image_widget.dart';
import 'menu_widget.dart';
// import 'package:observable/observable.dart';
// import 'package:rxdart/rxdart.dart';
// int pricewisesort=0;
// String placetype = "";

// ignore: must_be_immutable
class CategoryWiseProductPage extends StatefulWidget {
  static String routeName = "/categoryproduct";
  final List<int> selected = [];
  // static int pricewisesort=0;
  // ignore: avoid_init_to_null
  int value;
  int prwayvalue;
  int placeprice;
  String searchvalueofsearchbar;

  @override
  _CategoryWiseProductPageState createState() =>
      _CategoryWiseProductPageState();
}

class _CategoryWiseProductPageState extends State<CategoryWiseProductPage> {
  
List<String> prway=["hour","day"];

  @override
  Widget build(BuildContext context) {
                        print("?????????????>>>>>>>>>>>>>>>>>>>>") ;
                    print(widget.prwayvalue.toString() + "index of price hour & day");
                    print("?????????????>>>>>>>>>>>>>>>>>>>>") ;
    // getData();
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final DocumentSnapshot cdata = arguments['SpaceCategory'];
   
    // int _totalplaces;
 //switch for day & hour price 
  //  bool isSwitched = true;  
  // var textValue = 'Switch is OFF'; 
  //  void toggleSwitch(bool value) {  
  
  //   if(isSwitched == false)  
  //   {  
  //     setState(() {  
  //       isSwitched = true;  
  //       textValue = 'Switch Button is ON';  
  //     });  
  //     print('Switch Button is ON');  
  //   }  
  //   else  
  //   {  
  //     setState(() {  
  //       isSwitched = false;  
  //       textValue = 'Switch Button is OFF';  
  //     });  
  //     print('Switch Button is OFF');  
  //   }  
  // } 
    // ignore: unused_local_variable
    var screenWidth = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.kWhiteColor,
      ),
    ); //lear and add at end
    // print(widget.selected);
    // print("in main");
print(arguments['cat_id']+"?????????????????????????????????");
    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,

      // map view button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingWidget(
        leadingIcon: Icons.explore,
        txt: "Map view",
        catId: arguments['cat_id'],
      ),

      body: SingleChildScrollView(
        //it will remove error of yellow color when all widget can't come in 1 page ,- provide scroll it has properties also
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MenuWidget(
                    iconImg: Icons.subject,
                    iconColor: ColorConstant.kBlackColor,
                    onbtnTap: (){
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                  ),
                  Expanded(child: Text(
                    cdata['name'],
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),),
                  // MenuWidget(
                  //   iconImg: Icons.add_shopping_cart,
                  //   iconColor: ColorConstant.kBlackColor,
                  // ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Text(arguments['SpaceCategory'],style: TextStyle(fontSize: 30,color: Colors.black),),
              SearchField(sendBackSearchValue: (String str){
                setState(() {
                              widget.searchvalueofsearchbar=str;
                              str=null;
                                });
              },),
              SizedBox(
                height: 10,
              ),
              Text(
                selectedLocation,
                style: TextStyle(fontSize: 25),
                // style: GoogleFonts.Muli(
                //   fontSize: 12,
                //   color: ColorConstant.kGreyColor,
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //     // "${List.from(cdata['name'].data()).toString().length}",
              //     "total places $_totalplaces"
              //     // style: GoogleFonts.notoSans(
              //     //   fontSize: 36,
              //     //   color: ColorConstant.kBlackColor,
              //     //   fontWeight: FontWeight.w500,
              //     // ),
              //     ),
              Divider(
                color: ColorConstant.kGreyColor,
                thickness: .2,
              ),
// ------------????????????????????????
              //  upeer default filter bar
              // Container(
              //   height: 50,
              //   width: double.infinity,
              //   child: ListView.separated(
              //     shrinkWrap: false,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: cdata['cat_type'].length,
              //     itemBuilder: (context, index) {
              //       return FilterChip(
              //         label: Text(cdata['cat_type'][index]),
              //         labelStyle: TextStyle(
              //           color: Colors.white,
              //           fontSize: 10,
              //           fontWeight: FontWeight.bold,
              //         ),
              //         padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
              //         elevation: 5,
              //         onSelected: (bool value) {
              //           setState(() {
              //             if (widget.selected
              //                 .contains(cdata['cat_type'][index])) {
              //               widget.selected.remove(cdata['cat_type'][index]);
              //             } else {
              //               widget.selected.add(cdata['cat_type'][index]);
              //             }
              //             print(widget.selected);
              //           });
              //         },
              //         selected:
              //             widget.selected.contains(cdata['cat_type'][index]),
              //         selectedColor: Colors.deepOrange[400],
              //         backgroundColor: Color(0xff6200ee),
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return SizedBox(
              //         width: 10,
              //       );
              //     },
              //   ),
              // ),
// ------------????????????????????????
// Container(
//   child: Switch(
//             value: isSwitched,
//             onChanged: (value) {
//               setState(() {                
//                 isSwitched = value;
//                 print(isSwitched.toString() + " $value ");
//               });
//             },
//             activeTrackColor: Colors.yellow,
//             activeColor: Colors.orangeAccent,
//           ),
//   //Switch(  
//   //             onChanged: toggleSwitch,                
//   //             value: isSwitched,  
//   //             activeColor: Colors.blue,  
//   //             activeTrackColor: Colors.yellow,  
//   //             inactiveThumbColor: Colors.redAccent,  
//   //             inactiveTrackColor: Colors.orange,  
//   //           )                      
// ),
              // Switchbtn(option :pricewisesort ,choosenway: (int n){
              //    setState(() {
              //       pricewisesort=n;    
              //       print("?????????????>>>>>>>>>>>>>>>>>>>>") ;
              //       print(pricewisesort.toString());
              //       print("?????????????>>>>>>>>>>>>>>>>>>>>") ;
              //   });
              //   },
              //    ),

              Container(
                width: double.infinity,
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      pressElevation: 0.0,
                      padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                      elevation: 5,
                      // selectedColor: Colors.blueGrey,
                      // selectedColor: Colors.deepOrange[400],
                      selectedColor: Colors.orangeAccent,
                      backgroundColor: Colors.blueGrey,//Colors.lightGreen,
                      // backgroundColor: Color(0xff6200ee),
                      label: Text("${prway[index].toString()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )),
                      selected: widget.prwayvalue == index,
                      onSelected: (bool selected) {
                        setState(()
                         {
                         
                          widget.prwayvalue = selected ? index : null;                         
                          //  if(widget.placeprice == null)
                          // {
                          //   widget.prwayvalue = null;
                          // } 
                          // print("+++++++++++++++++++++++++++");
                          // print(widget.prwayvalue);
                          // print(selected);
                          // widget.placeprice = (widget.prwayvalue == null)
                          //     ? null
                          //     : cdata['cat_type'][index];
                              print(" .............................................. ");                      print("  .............................................. ");  
                          // print(widget.placeprice);
                          print("............................ "+ widget.placeprice.toString() +".................."+widget.prwayvalue.toString());                      
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 3,
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),              
              Container(
                width: double.infinity,
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: List.from(cdata['cat_type']).length,
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      pressElevation: 0.0,
                      padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                      elevation: 5,
                      selectedColor: Colors.orangeAccent,
                      // backgroundColor: Colors.grey[100],
                      backgroundColor: Color(0xff6200ee),
                      label: Text("${cdata['cat_type'][index].toString()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          )),
                      selected: widget.value == index,
                      onSelected: (bool selected) {
                        setState(()
                         {                           
                          widget.value = selected ? index : null;                          
                          print("+++++++++++++++++++++++++++");
                          // print(widget.value);
                          // print(selected);
                          widget.placeprice = (widget.value == null)
                              ? null
                              : cdata['cat_type'][index];
                              
                            print("?????????????????????????????");                  
                          // print(widget.placeprice);
                          print("???????????????? "+ widget.placeprice.toString() +"?????????????..................."+widget.prwayvalue.toString());                      
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // --------
            //  (widget.searchvalueofsearchbar =="")?
              FutureBuilder(
                future:                  
               (widget.placeprice != null )
                      ?
                          ( widget.searchvalueofsearchbar==null || widget.searchvalueofsearchbar==""  )
                        ?
                          (widget.prwayvalue == 1)      ?
                        Firestore.instance
                          .collection('places')
                          .where('day_price', isEqualTo:widget.placeprice)//.orderBy('hour_price',descending: true)
                          .where('category_id', isEqualTo: arguments['cat_id'])//.orderBy('category_id',descending: true)
                          .where('placeofcity', isEqualTo: selectedLocation)
                          // .orderBy('day_price',descending: true)
                          .getDocuments() :
                          Firestore.instance
                          .collection('places')
                          .where('hour_price', isEqualTo:widget.placeprice)//.orderBy('hour_price',descending: true)
                          .where('category_id', isEqualTo: arguments['cat_id'])//.orderBy('category_id',descending: true)
                          .where('placeofcity', isEqualTo: selectedLocation)
                          // .orderBy('day_price',descending: true)
                          .getDocuments() 
                          : 
                            (widget.prwayvalue == 1)                       
                          ?
                           Firestore.instance
                          .collection('places')
                          .where('day_price', isEqualTo: widget.placeprice)                          
                          .where('category_id', isEqualTo: arguments['cat_id'])
                          .where('placeofcity', isEqualTo: selectedLocation)                          
                          .where('spacename', isEqualTo: widget.searchvalueofsearchbar)  
                          // .orderBy('day_price',descending: true)                                                                         
                          .getDocuments()
                          :
                          Firestore.instance
                          .collection('places')
                          .where('hour_price', isEqualTo: widget.placeprice)                          
                          .where('category_id', isEqualTo: arguments['cat_id'])
                          .where('placeofcity', isEqualTo: selectedLocation)                          
                          .where('spacename', isEqualTo: widget.searchvalueofsearchbar)  
                          // .orderBy('day_price',descending: true)                                                                         
                          .getDocuments()
                        
                      :  
                      (widget.searchvalueofsearchbar!="" ||  widget.searchvalueofsearchbar!=null )
                         ? Firestore.instance
                          .collection('places')
                          .where('category_id', isEqualTo: arguments['cat_id'])
                          .where('placeofcity', isEqualTo: selectedLocation)
                          .where('spacename', isEqualTo: widget.searchvalueofsearchbar)
                          .getDocuments()
                          :
                          Firestore.instance
                          .collection('places')
                          .where('category_id', isEqualTo: arguments['cat_id'])                                                 
                          .where('placeofcity', isEqualTo: selectedLocation)//.startAt()
                          .getDocuments()
                          // .then((value) {
                          //   setState(() {
                          //       _totalplaces= value.documents.length;
                          //   });
                          //   print(value.documents.length);
                          //   print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          //   print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          //   print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");                            
                          // })
                          ,
                builder: (context, snapshot){
                  if(snapshot.hasError){return Container(child: Text("error in snapshot data"),);}
                  if (snapshot.hasData)
                  {
                    
                    // _totalplaces= snapshot.data.documents.length;                    
                    return Column(
                      children: List.generate(
                        // Constants.houseList.length,
                        // place.itemCount,
                        snapshot.data.documents.length,
                        (index) {
                  // print("?||||||||||||||||||||||||||||||||||||| "+ widget.searchvalueofsearchbar.toString() + widget.placeprice.toString());

                          print("---------------??????????????>>>>>>>>>>>>>>>>>>>>!!!!!!___________________"+snapshot.data.documents.length.toString());
                    // print(List.from(snapshot.data.documents[0]).toString());
                    // print("---------------??????????????>>>>>>>>>>>>>>>>>>>>!!!!!!____________________");
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ImageWidget(
                              // snapshot.data.docs[index],
                              snapshot.data.documents[index],  
                            // [{abc:zdhu,}],
                              // index,
                              // Constants.imageList,
                            ),
                          );
                        },
                      ),
                    );
                  }//if
                  else{
                      return Center(child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: CircularProgressIndicator(),
                      ));
                  }
                  // return;
                },
                ),
                SizedBox(height: 60,),
                // :
                // Container(
                //   // child: ,
                // ),
                
                
                // --------------------------------
                
              // StreamBuilder<QuerySnapshot>(
              //     stream: 
              // (widget.placetype != null && widget.placetype != "")
              //         ?
              //             (searchbyname!="" && searchbyname!="")
              //           ? FirebaseFirestore.instance
              //             .collection('places')
              //             .where('type', isEqualTo: widget.placetype)
              //             .where('category_id', isEqualTo: arguments['cat_id'])
              //             .where('placeofcity', isEqualTo: selectedLocation)                          
              //             .where('spacename', isEqualTo: searchbyname)                                                   
              //             // .where('spacename',isLessThan: searchbyname)
              //             .snapshots()
              //           : FirebaseFirestore.instance
              //             .collection('places')
              //             .where('type', isEqualTo: widget.placetype)
              //             .where('category_id', isEqualTo: arguments['cat_id'])
              //             .where('placeofcity', isEqualTo: selectedLocation)
              //             .snapshots()
              //         :  
              //         (searchbyname!="" && searchbyname!="")
              //            ? FirebaseFirestore.instance
              //             .collection('places')
              //             .where('category_id', isEqualTo: arguments['cat_id'])
              //             .where('placeofcity', isEqualTo: selectedLocation)
              //             .where('spacename', isEqualTo: searchbyname)
              //             .snapshots()
              //             :FirebaseFirestore.instance
              //             .collection('places')
              //             .where('category_id', isEqualTo: arguments['cat_id'])
              //             .where('placeofcity', isEqualTo: selectedLocation)//.startAt()
              //             .snapshots(),
              //     builder: (context, snapshot) {
              //       print(widget.placetype);

              //       print(
              //           "ok ---------------------------------------------------\n");
              //       if (snapshot.hasError) {
              //         return Text('Something went wrong');
              //       }
              //       print(widget.selected);
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Text("Loading");
              //       }

              //       if (!snapshot.hasData) {
              //         return Text("don't have data");
              //       }

              //       //  List.from((snapshot.data.docs[0]['amenities'].data())).contains(element);

              //       print("total in search = ${snapshot.data.docs.length}");
              //       // setState(() {
              //       //               noofqry=    snapshot.data.docs.length;
              //       //                     });
              //       return Column(
              //         children: List.generate(
              //           // Constants.houseList.length,
              //           // place.itemCount,
              //           snapshot.data.docs.length,
              //           (index) {
              //             return Padding(
              //               padding: const EdgeInsets.only(top: 10),
              //               child: ImageWidget(
              //                 snapshot.data.docs[index],
              //                 // index,
              //                 // Constants.imageList,
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

// ------- copy
