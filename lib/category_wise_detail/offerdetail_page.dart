// import 'package:coworking_space/category_wise_detail/car.dart';
import 'package:flutter/material.dart';
// import 'package:coworking_space/category_wise_detail/personal_space_main.dart';

import 'list_all_item_in_way.dart';

offerDetails(double sheetItemHeight,List<Map<Icon, String>> info) {
    return Container(
      // padding: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(top: 15, left: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offer Details",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Container(
            
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: info.length,
              // currentCar.offerDetails.length,
              itemBuilder: (context, index) {
                return ListItem(
                sheetItemHeight: sheetItemHeight,
                  mapval: info[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }