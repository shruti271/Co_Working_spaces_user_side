import 'package:flutter/material.dart';

import '../../../constants.dart';

class CityDropDownBar extends StatefulWidget {
  @override
  _CityDropDownBarState createState() => _CityDropDownBarState();
}

class _CityDropDownBarState extends State<CityDropDownBar> {   
  
    final  List<String> _locations = ['Ahmedabad', 'Bombay', 'Bangalore', 'surat','delhi'];
    //if we write pls select city in '_selectedLocation' then it will give error bcz that string is not included in '_locations' so meas all string have include in list
    // FocusNode dynamicfocus=new FocusNode();

  @override
  Widget build(BuildContext context) {
        return Container(                            
              margin: EdgeInsets.all(20),                            
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.amber,   
                color: kSecondaryColor.withOpacity(0.1), 
                border: Border.all(width: 0.5)                                                    
              ),
              child: DropdownButton<String>(
                hint: Text('Please choose a location'), 
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 31,// Not necessary for Option 1
                isExpanded: true,                
                underline: SizedBox(height: 20,),
                value:selectedLocation.isNotEmpty ? selectedLocation : null,         
            onChanged: (newValue) {
              setState(() {
                selectedLocation = newValue;
              });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
              );
            }).toList(),
          ),          
    );
  }
}
