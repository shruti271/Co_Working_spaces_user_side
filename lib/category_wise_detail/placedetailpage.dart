import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/category_wise_detail/sheetcontainer.dart';
// import 'package:coworking_space/category_wise_detail/car.dart';
// import 'package:coworking_space/category_wise_detail/sheetcontainer.dart';
import 'package:flutter/material.dart';

import 'image_animation_page_of_sheetcontainer.dart';
// import 'item_detaile_page.dart';

// ignore: must_be_immutable
class LayoutStarts extends StatelessWidget {
  
  final DocumentSnapshot info;

  LayoutStarts({@required this.info});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[        
          ItemDetailScreen(info: info),
          SheetContainer(info: info),        
        ],
      ),
    );
  }
}
