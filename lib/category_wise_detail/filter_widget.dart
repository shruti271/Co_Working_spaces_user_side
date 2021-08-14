import 'package:flutter/material.dart';
// import '../constants.dart';
final List<String> selected=[];
// var selected = [];
List<String> searchplace=[];
// searchplace=globa.selected;

class FilterChipScreen extends StatefulWidget {
    final String filterTxt;
  const FilterChipScreen({
    Key key,
    this.filterTxt,
  }) : super(key: key);
  @override
  _FilterChipScreenState createState() => _FilterChipScreenState();
}

class _FilterChipScreenState extends State<FilterChipScreen> {  
  
  @override
  Widget build(BuildContext context) {
    return 
          FilterChip(
                label: Text(widget.filterTxt),
                labelStyle: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold,),
                padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
                elevation: 5,
                onSelected: (bool value) {
                  setState(() {
                  if (selected.contains(widget.filterTxt)) {
                    selected.remove(widget.filterTxt);
                    // selected.remove("${widget.filterTxt}");
                  } else {
                    selected.add(widget.filterTxt);
                    // searchfilter.add("${widget.filterTxt}");
                  }
                  print(selected);

                  });
                },
                
                selected: selected.contains(widget.filterTxt),
                selectedColor: Colors.deepOrange[400],                
                backgroundColor: Color(0xff6200ee),
              
             
    );
  }
}

/*
class FilterWidget extends StatefulWidget {
   final String filterTxt;
  const FilterWidget({
    Key key,
    this.filterTxt,
  }) : super(key: key);
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    bool _isselected=false;
    // return FilterChip(
    //             label: Text(data[index]),
    //             onSelected: (bool value) {
    //               if (selected.contains(index)) {
    //                 selected.remove(index);
    //               } else {
    //                 selected.add(index);
    //               }
    //               setState(() {});
    //             },
                
    //             selected: selected.contains(index),
    //             selectedColor: Colors.deepOrange,
    //             labelStyle: TextStyle(
    //               color: Colors.white,
    //             ),
    //             backgroundColor: Colors.green,
    //           ),
    //     ),
    //   ),
    // )
        return FilterChip(
            label: Text(widget.filterTxt),
            labelStyle: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold,),
            padding: EdgeInsets.fromLTRB(15, 15, 10, 15),
            elevation: 5,
            // labelPadding: EdgeInsets.all(10),            
            selected: _isselected,
            // backgroundColor: Color(0xff6200ee),
            backgroundColor: Colors.pink,
            selectedColor: Colors.yellow,
            pressElevation: 5,
            shadowColor: Colors.blueAccent,
            showCheckmark: true,
       onSelected: (bool isselected)
       {
         
           setState((){
              _isselected=isselected;
           });
       }
      // onSelected: (bool value) {
      //             if (selected.contains(index)) {
      //               selected.remove(index);
      //             } else {
      //               selected.add(index);
      //             }
      //             setState(() {});
      //           },
    
        );
  }
}
*/
/*
class FilterWidget extends StatelessWidget {
  final String filterTxt;
  const FilterWidget({
    Key key,
    this.filterTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: ColorConstant.kFilterBackColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Text(
              filterTxt,
              // style: GoogleFonts.notoSans(
              //   fontSize: 18,
              //   fontWeight: FontWeight.w500,
              //   color: ColorConstant.kBlackColor,
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
*/