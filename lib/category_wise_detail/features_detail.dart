import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'list_all_item_in_way.dart';

features(double sheetItemHeight, DocumentSnapshot info,String sname) {
  return Container(
    // padding: EdgeInsets.only(top: 15),
    padding: EdgeInsets.only(top: 15, left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${sname.toUpperCase()}",
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
            itemCount: info[sname].length,
            itemBuilder: (context, index) {
              return Container(
                width: sheetItemHeight,
                height: sheetItemHeight,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(                                    
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26)
                ),
                child: Center(child: Text("${info[sname][index]}")),
              );
              // ListItem(
              //   sheetItemHeight: sheetItemHeight,
              //   mapval: info[index],
              // );
            },
          ),
        )
      ],
    ),
  );
}


class ListItem extends StatelessWidget {
  final double sheetItemHeight;
  // final Map mapVal;
  final Map<Icon, String> mapval;
  // final List<String> mapval;

  ListItem({this.sheetItemHeight, this.mapval});

  @override
  Widget build(BuildContext context) {
    var innerMap;
    bool isMap;

    if (mapval.values.elementAt(0) is Map) {
      innerMap = mapval.values.elementAt(0);
      isMap = true;
    } else {
      innerMap = mapval;
      isMap = false;
    }

    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          mapval.keys.elementAt(0),
          isMap
              ? Text(innerMap.keys.elementAt(0),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, letterSpacing: 1.2, fontSize: 11))
              : Container(),
          Text(
            innerMap.values.elementAt(0),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
