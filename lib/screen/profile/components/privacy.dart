import 'package:flutter/material.dart';

class BuildPrivcy extends StatefulWidget {
  // const BuildPrivcy({ Key? key }) : super(key: key);

  @override
  _BuildPrivcyState createState() => _BuildPrivcyState();
}

class _BuildPrivcyState extends State<BuildPrivcy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
               height: 10,
          ),
          Text(
            'What payment options does Co-working space accept?',textAlign: TextAlign.left,
            style: TextStyle( fontSize: 17.0,color:Colors.black),
          ),
           Text(
            'Co-working space accepts most payment methods available on Razorpay such as Net banking, UPI, GPay, Debit, and Credit-Cards.',
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
               height: 10,
          ),
          Text(
            'What payment options does Co-working space accept?',textAlign: TextAlign.left,
            style: TextStyle( fontSize: 18.0,color:Colors.black),
          ),
           Text(
            'Co-working space accepts most payment methods available on Razorpay such as Net banking, UPI, GPay, Debit, and Credit-Cards.',
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
               height: 10,
          ),
          Text(
            'Do I pay at the space?',textAlign: TextAlign.left,
            style: TextStyle( fontSize: 17.0,color:Colors.black),
          ),
           Text(
            'NO. You have to make the payment to GoFloaters through our web app or through our mobile app while booking the space. Payments will not be collected at the space. Bookings will only be processed once payment is complete',
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
               height: 10,
          ),
          Text(
            'Can I pay by cash?',textAlign: TextAlign.left,
            style: TextStyle( fontSize: 18.0,color:Colors.black),
          ),
           Text(
            'We don’t accept cash. We accept most forms of online payment including net-banking, credit card, debit card, UPI, and many wallets.',
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
      ),
    
    );
  }
}