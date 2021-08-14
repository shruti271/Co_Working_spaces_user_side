import 'package:flutter/material.dart';  
  
class BookingScreen extends StatelessWidget {  
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
              'How do I book a Co-working space?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'You can book Co-working spaces using our web app or mobile apps. You can download the Co-working app from Google PlayStore.',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
            SizedBox(
                 height: 10,
            ),
            Text(
              'What are the working hours for Co-working spaces?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'Each space has different operation times which is mentioned on the detail page of the individual listings. Most of the spaces are open from 9 AM to 7 PM.',
                style: TextStyle(fontSize: 15.0),
            ),
             ),
            SizedBox(
                 height: 10,
            ),
            Text(
              'Can I bring a guest or a friend to a GoFloaters space?',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                'Sorry, we don’t allow guests to accompany you.you have to login or register in app.',
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