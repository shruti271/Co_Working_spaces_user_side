// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
// import 'package:coworking_space/constants.dart';
// import 'package:coworking_space/enums.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'fav_page.dart';

// class MainpageOfFavourite extends StatefulWidget {
//   static String routeName = "\myfavpage";

//   @override
//   _MainpageOfFavouriteState createState() => _MainpageOfFavouriteState();
// }

// class _MainpageOfFavouriteState extends State<MainpageOfFavourite> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Favourites" , style: TextStyle( color:kPrimaryColor),),
//       ),
//       body: FutureBuilder(
//           future: Firestore.instance
//               .collection("userdetails")
//               .document("weVfSkoCOXb81rqb1IKn")
//               .get(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               // return CircularProgressIndicator();

//               int n = List.from(snapshot.data['favplaces']).length;
//               // print(snapshot.data['favplaces'].toString() + ">>>>>>>>>>>>>>>>>.$n");
//               return ListView.builder(
//                   itemCount: n,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       // height: 500,
//                       child: Dismissible(
//                         // key: Key(curcart.demoCarts[index].product.id.toString()),
//                         key: Key(snapshot.data['favplaces'][index]),
//                         direction: DismissDirection.endToStart,
//                         onDismissed: (direction) {
//                           // Provider.of<CartBox>(context, listen: false).removeItem(id);
//                           Firestore.instance
//                               .collection('userdetails')
//                               .document("weVfSkoCOXb81rqb1IKn")
//                               .updateData({
//                             'favplaces': FieldValue.arrayRemove(
//                                 [snapshot.data['favplaces'][index]])
//                           }).then((value) {
//                             print("successful completed!-----------");
//                           });
//                           // setState(() {
//                           //   curcart.removeItem(index.toString());
//                           // });
//                         },
//                         background: Container(
//                           // height: 100,
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFFFE6E6),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: Row(
//                             children: [
//                               Spacer(),
//                               SvgPicture.asset("assets/icons/Trash.svg"),
//                               // Text('2'),
//                             ],
//                           ),
//                         ),
//                         // child:CartCard(cart: cart.demoCarts[index]),
//                         child: Container(
//                             height: 360,
//                             child: MyfavCard(
//                                 placesid: snapshot.data['favplaces'][index])),
//                       ),
//                     );
//                   });
//             } else {
//               return Center(child: Text("you don't have added places..."));
//             }
//           }),
//       bottomNavigationBar:
//           CustomBottomNavBar(selectedMenu: MenuState.favourite),
//     );
//   }
// }



// 12-7 change

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
import 'package:coworking_space/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fav_page.dart';

class MainpageOfFavourite extends StatefulWidget {
  static String routeName = "\myfavpage";

  @override
  _MainpageOfFavouriteState createState() => _MainpageOfFavouriteState();
}
 String user ;
Future<void> getdata() async {
   final prefs = await SharedPreferences.getInstance();
 user = prefs.getString('current_login_user');
//   if(user.startsWith(new RegExp(r'-'))){
//     //new RegExp(r'[A-Z][a-z]')
   
//      user=user.substring(1, user.length-1);
   
   
// print("?????????????????? -------------------------------user"+user);
//  }
//  if(user.startsWith("-")){
   
//      user=user.substring(1, user.length-1);
   
   
// print("?????????????????? -------------------------------user"+user);
//  }
//  print("??????????????????"+user);
}
class _MainpageOfFavouriteState extends State<MainpageOfFavourite> {
 
@override
  void initState() {
    getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favrouites"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("userdetails")
              .document("$user")
              .snapshots(),
          builder: (context, snapshot) {
            print("++++++++++++++++++++++++++++++++++++++++++++++++++++out");
            if(snapshot.hasData && snapshot.data!=null){
              // return CircularProgressIndicator();
            // print("++++++++++++++++++++++++++++++++++++++++++++++++++++in ${snapshot.data['firstname']}");
            // snapshot.data.documents[index]
            // print("++++++++++++++++++++++++++++++++++++++++++++++++++++in ${snapshot.data.documents[0]['firstname']}");
            int n=0;
            List<String> nam=[];
            nam=List.from(snapshot.data['favplaces']);
            if(nam.isNotEmpty){
              n = List.from(snapshot.data['favplaces']).length;
            }
            // if(List.from(snapshot.data['favplaces']) != null){
            //    n = List.from(snapshot.data['favplaces']).length;
            // }
            
            // print(">>>>>>>>>>>>>>>>>.$n");
            // if(n!=0){
            return (n!=0)
            ?ListView.builder(
                itemCount: n,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
              // height: 500,
              child: Dismissible(
                // key: Key(curcart.demoCarts[index].product.id.toString()),
                // key: Key(snapshot.data['favplaces'][index]),
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // Provider.of<CartBox>(context, listen: false).removeItem(id);
                        Firestore.instance
                            .collection('userdetails').document(user).updateData({'favplaces':FieldValue.arrayRemove([snapshot.data['favplaces'][index]])}).then((value) { print("successful completed!-----------");});
                  // setState(() {
                  //   curcart.removeItem(index.toString());
                  // });
                },
                background: Container(
                  // height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                      // Text('2'),
                    ],
                  ),
                ),
                // child:CartCard(cart: cart.demoCarts[index]),
                child: Container(height: 360, child: MyfavCard(placesid : snapshot.data['favplaces'][index])),
              ),
            );
                })
            :Center(child: Text("you don't added places..."));
           
          }else {return Center(child: Text("you don't added places..."));}
          }),
          bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
