import 'package:flutter/material.dart';  
  
class PaymentScreen extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Container(
      child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                 height: 10,
            ),
            Text(
              'What payment options does Co-working space accept?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'Co-working space accepts most payment methods available on Razorpay such as Net banking, UPI, GPay, Debit, and Credit-Cards.',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
            SizedBox(
                 height: 10,
            ),
            Text(
              'What payment options does Co-working space accept?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'Co-working space accepts most payment methods available on Razorpay such as Net banking, UPI, GPay, Debit, and Credit-Cards.',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
            SizedBox(
                 height: 10,
            ),
            Text(
              'Do I pay at the space?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'NO. You have to make the payment to GoFloaters through our web app or through our mobile app while booking the space. Payments will not be collected at the space. Bookings will only be processed once payment is complete',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
            SizedBox(
                 height: 10,
            ),
            Text(
              'Can I pay by cash?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'We don’t accept cash. We accept most forms of online payment including net-banking, credit card, debit card, UPI, and many wallets.',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
          ],
        ),
      ),
      ),
    );
  }  
}  