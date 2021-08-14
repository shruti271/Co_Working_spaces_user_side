// import 'package:coworking_space/models/Cart.dart';
import 'package:coworking_space/screen/notification/notification.dart';
import 'package:coworking_space/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
// import 'package:coworking_space/screen/cart/cart_screen.dart';
// import 'package:provider/provider.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
// import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  int count=Provider.of<CartBox>(context).itemCount;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SearchField(),
          
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",    
            // numOfitem: Provider.of<CartBox>(context).itemCount,
            press: () => {              
              Navigator.pushNamed(context, CartScreen.routeName)
              },
          ),
          Text("CO-WORKOING",style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.9) ),),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            // numOfitem: ,
            press: () {
               Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NsScreen()),
                  );
            },
          ),
        ],
      ),
    );
  }
}
