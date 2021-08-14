import 'package:coworking_space/screens/cart/components/body.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartBox>(context);
    return 
      
      Scaffold(
        appBar: AppBar(
        title: Text("My Ticket"),
      ),
        body: //MYdemo(),
        Body(),
        // bottomNavigationBar: CheckoutCard(),      
    );
  }

  AppBar buildAppBar(context) {
    // int cat = Provider.of<CartBox>(context).itemCount;
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "9",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
