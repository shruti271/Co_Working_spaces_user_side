import 'package:flutter/material.dart';
import 'list_all_item_in_way.dart';

// ignore: must_be_immutable
class Spacefacility extends StatelessWidget {
  // Features spaces;
  final List<Map<Icon, String>> amenities;
  final List<Map<Icon, String>> spaceinfo;

  Spacefacility({@required this.amenities,@required this.spaceinfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 1, left: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Features",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          features(110, amenities),
          Text(
            "spaceinfo",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          features(110, spaceinfo),
        ],
      ),
    );
  }
}

features(double sheetItemHeight, List<Map<Icon, String>> info) {
  return Container(
    padding: EdgeInsets.only(top: 5, left: 10,bottom: 10),
    child: Container(
      margin: EdgeInsets.only(top: 5),
      height: sheetItemHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return ListItem(
            sheetItemHeight: sheetItemHeight,
            mapval: info[index],
          );
        },
      ),
    ),
  );
}
