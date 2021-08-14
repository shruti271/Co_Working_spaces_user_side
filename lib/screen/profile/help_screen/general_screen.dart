import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {
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
                'What is Co-working space ?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Co-working space is a platform that helps you find work and meeting spaces that can be booked instantly.',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'What do people use Co-working space for ?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Our customers use our spaces for everyday work, meetings, interviews, small events, workshops, training, meet-ups, client meetings, etc. Teams use our spaces for meeting & collaborating frequently.',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'What amenities are included?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'High-speed WiFi, power points, and a safe & comfortable atmosphere is included in our pricing. Other amenities vary by space. You can check the individual listings on our app for more details.',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'How many spaces are listed on the platform?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Our spaces are available on-demand and you only pay for what you use. We have 1200+ spaces across 12 cities and we are adding more every week!',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Which cities do you serve?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 17.0, color: Colors.black,fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We are currently operational in  Ahmedabad , Bombay , Bangalore , Surat , Delhi. But we’ll be in your city very soon, so hold on.',
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
