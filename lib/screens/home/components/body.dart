// import 'package:coworking_space/google_map/map_body.dart';
// import 'package:coworking_space/models/Cart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coworking_space/category_all_at_home/body.dart';
// import 'package:coworking_space/components/default_button.dart';
import 'package:coworking_space/rating_wise_product/product_rating_list.dart';
// import 'package:coworking_space/rating_wise_product/product_rating_list.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:provider/provider.dart';
import '../../../size_config.dart';
import 'citydropdown_menu_page.dart';
import 'home_header.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // double rate=0;

  // ignore: non_constant_identifier_names
  Widget image_carousel= new Container(
     height:170,
      width: 350.0,
     child :new Carousel(
       boxFit : BoxFit.cover,
       images: [
        //  AssetImage("assets/images/j4.jpg"),
        //  AssetImage("assets/images/j2.jpg"),
        //  AssetImage("assets/images/j3.jpg"),
        //  AssetImage("assets/images/j4.jpg"),
        AssetImage("assets/images/s3.jpg"),        
        AssetImage("assets/images/4.jpg"),
        AssetImage("assets/images/2.jpg"),
        AssetImage("assets/images/1.jpg"),
        
         
       ],
       autoplay: true,
       animationCurve: Curves.fastOutSlowIn,
       animationDuration: Duration(milliseconds:1000),
       dotSize: 6.0,
       dotSpacing: 15.0,
       dotColor: Colors.black,
       borderRadius: true,
     ),
   );
   
  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    // getc();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),                        
            SizedBox(height: getProportionateScreenWidth(10)),
            CityDropDownBar(),   
            image_carousel,
            // myslide(),

            mycat(),            
            // CategoryOfPlace(),
            // favicon(),
            SizedBox(height: 40,),
            // MYdemo(),
        //     Column(
        //       children: List.generate(
        //        5,
        // (index){
              
        //       return Container(
        //         height: 200,
        //         width: 100,
        //         child: Text("hello"),
        //       );
        //  } ),
        //     )            
            // Myratingcard(),
//                        RatingBar(
//    initialRating: 3,
//    minRating: 0,
//    direction: Axis.horizontal,
//    allowHalfRating: true,
//    itemCount: 5,
//    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//     ratingWidget: RatingWidget(
//             full: Icon(Icons.star),
//             half: Icon(Icons.star_half),
//             empty:  Icon(Icons.star_border),
//           ),
//   //  itemBuilder: (context, _) => Icon(
//   //    Icons.star,
//   //    color: Colors.amber,
//   //  ),
//   updateOnDrag: true,
//    onRatingUpdate: (rating) async {
//      print(rating);
//      double rate=0;
//      await Firestore.instance.collection('places').document("Vr5ZwLA9140ylov1rG83").get().then((value) {
//         setState(() {
//           print("??????????????????????//////////////////////// firebase "+rating.toString());
//           print( value.data['rating']);
//           print("??????????????????????////////////////////////");
//                   rate = value.data['rating'];
//                   rate +=  rating;
//                 });

//      });
     
//      print("????????????????????????????????????"+rate.toString());
//      Firestore.instance.collection('places').document("Vr5ZwLA9140ylov1rG83").updateData({'rating':rate});
//      print("????????????????????????????????????");
//    },
// ), 
// ------------------------------------------------------------------------------------------------------------------------
// // ignore: deprecated_member_use
// FlatButton(onPressed: (){
//   showDialog(
//                       context: context,
//                       builder: (ctx) => AlertDialog(
//                         title: Text("give review to place"),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                         content: Container(child:       
//                         RatingBar(
//                                     initialRating: 3.5,
//                                     minRating: 0,
//                                     direction: Axis.horizontal,
//                                     allowHalfRating: true,
//                                     itemCount: 5,
//                                     itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
//                                       ratingWidget: RatingWidget(
//                                               full: Icon(Icons.star),
//                                               half: Icon(Icons.star_half),
//                                               empty:  Icon(Icons.star_border),
//                                             ),
//                                     //  itemBuilder: (context, _) => Icon(
//                                     //    Icons.star,
//                                     //    color: Colors.amber,
//                                     //  ),
//                                     updateOnDrag: true,
//                                     onRatingUpdate: (rating) async {
//                                       print(rating);
//                                         // double rate=0;
//                                       await Firestore.instance.collection('places').document("Vr5ZwLA9140ylov1rG83").get().then((value) {
//                                           setState(() {
//                                             print("??????????????????????//////////////////////// firebase "+rating.toString());
//                                             print( value.data['rating']);
//                                             print("??????????????????????////////////////////////");
//                                                     rate = value.data['rating'];
//                                                     rate +=  rating;
//                                                   });

//                                       });
//                                       Firestore.instance.collection('rate_place').add({
//                                         'place_id':"Vr5ZwLA9140ylov1rG83",
//                                         'rate':rating,
//                                         'user_id':"weVfSkoCOXb81rqb1IKn"
//                                       }).then((value) {
//                                         value.get().then((value) async{
//                                           var finalrate,totalreviewuser;
//                                           var total=[];

//                                           await Firestore.instance.collection('rate_place').where('place_id', isEqualTo: "Vr5ZwLA9140ylov1rG83").getDocuments().then((value) {
//                                             value.documents.forEach((element) { 
//                                               //  finalrate = finalrate +
//                                                 print(element.data['rate']);
//                                                 total.add(element.data['rate']);
//                                                 print("===========================");
//                                                 print("===========================");
//                                               // totalreviewuser++;
//                                             });
//                                              for (var i in total) {
//     finalrate = finalrate + i;
//   }
//   print("==========================="+finalrate.toString());
//                                                 print("===========================");
//                                           });
//                                           // await Firestore.instance.collection('places').document("Vr5ZwLA9140ylov1rG83").updateData({'rating':finalrate/totalreviewuser});
//                                         });
//                                       });
//                                       print("????????????????????????????????????"+rate.toString());
//                                       //  Firestore.instance.collection('places').document(widget.placeId).updateData({'rating':rate});
//                                       print("????????????????????????????????????");
//                                     },
//                                   ),
//                                   ),
//                         actions: <Widget>[
//                           // ignore: deprecated_member_use
//                           FlatButton(
//                             onPressed: () {
//                               Navigator.of(ctx).pop();
//                             },
//                             child: Text("okay"),
//                           ),
//                         ],
//                       ),
//                     );
// }, child: Text("click")),
// ------------------------------------------------------------------------------------------------------
            HomePageRatingView(), 
         
            // Nearbyplacelocation(),                        
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
// class favicon extends StatefulWidget {
//   @override
//   _faviconState createState() => _faviconState();
// }
// // ignore: camel_case_types
// class _faviconState extends State<favicon> {
//   Color _favIconColor = Colors.grey;
//   @override
//   Widget build(BuildContext context) {
    
//     return Container(
      
//       child: IconButton(
//                       icon: Icon(Icons.favorite),
//                       color: _favIconColor,
//                       tooltip: 'Add to favorite',
//                       onPressed: () {
//                         setState(() {
//                           if(_favIconColor == Colors.grey){
//                             _favIconColor = Colors.red;
//                           }else{
//                         _favIconColor = Colors.grey;
//                     }
//                });}
//       ),
//     );
//   }
// }

// ignore: camel_case_types
class myslide extends StatefulWidget {
  // const myslide({ Key? key }) : super(key: key);

  @override
  _myslideState createState() => _myslideState();
}

// ignore: camel_case_types
class _myslideState extends State<myslide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        children: [
          CarouselSlider(
            autoPlay: true,
            // autoPlayAnimationDuration: Duration(seconds: 100),
            // autoPlayInterval: Duration(seconds: 1000),
            items: [
         
              
               Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:  NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j1.jpg?alt=media&token=c1fe570f-8418-4371-a130-16193d4cc52b"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),                

              Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j2.jpg?alt=media&token=8a36604a-e281-473d-8fbe-763b1369e292"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j3.jpg?alt=media&token=2b416506-dc35-4316-beea-2a28ed390798"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j4.jpg?alt=media&token=04f26dee-a8d8-4637-9015-d10e94b3422d"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j5.jpg?alt=media&token=49a99fcd-a5af-4bb3-b8ef-2f72d83e4d84"),                      
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j6.jpg?alt=media&token=b9314787-afe0-44f4-a6c8-1c592df2c1f0"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image:NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j7.jpg?alt=media&token=6e77c690-da52-4c62-98d5-d7925e9bcdbc"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),

                            Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/coworking-app-cd89c.appspot.com/o/j9.jpg?alt=media&token=7568dec0-fe7c-4e49-b518-0a557b8ff9c2"),
                      fit: BoxFit.cover,
                    ),                    
                  ),
              ),
            ]
          ),
        ],
      ),
    );
  }
}