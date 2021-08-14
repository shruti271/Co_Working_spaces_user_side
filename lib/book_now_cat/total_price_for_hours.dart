import 'package:flutter/material.dart';

// int total_hour_price;

class Hourtotalprice extends StatefulWidget {

final int hporprice;
final DateTime startdate;
final DateTime enddate;
Hourtotalprice({@required this.hporprice,@required this.startdate,@required this.enddate});

  @override
  _HourtotalpriceState createState() => _HourtotalpriceState();
}

class _HourtotalpriceState extends State<Hourtotalprice> {
  void totalprice(){

  }
@override
void initState() { 
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
    var dif;
    setState(() {
          dif=widget.enddate.difference(widget.startdate).inDays;
        });
    print(dif);
    print("]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
    return Container(
      child: Text("$dif"),
    );
  }
}