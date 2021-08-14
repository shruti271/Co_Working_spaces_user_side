import 'package:flutter/material.dart';

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

// if(mapval.isEmpty)
// {
//   innerMap = mapval;
//       isMap = false;
// }else{
//    innerMap = mapval;
//       isMap = true;
// }
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
