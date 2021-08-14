import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

// String searchbyname="";
Stream searchstream;

class SearchField extends StatefulWidget {

  final Function(String) sendBackSearchValue;
  SearchField({@required this.sendBackSearchValue});

  // const SearchField({
  //   Key key,
  // }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          print("this is -------------------"+value);
          setState(() {
            // searchstream.join();
            if(value=="" || value==null)
            widget.sendBackSearchValue("");// searchbyname="";
            else
            widget.sendBackSearchValue(value);
          });
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(19)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search workspace",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
