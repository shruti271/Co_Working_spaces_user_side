import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
class Switchbtn extends StatefulWidget {
  final int option;
  final Function(int) choosenway;
  // final Function(DateTime) onDateChanged;
  Switchbtn({@required this.option,@required this.choosenway});
  // const Switchbtn({ Key? key }) : super(key: key);

  @override
  _SwitchbtnState createState() => _SwitchbtnState();
}

class _SwitchbtnState extends State<Switchbtn> {
  int isSwitched=0;

  void changeway(int index){
     widget.choosenway(index);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child:
      //  Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(top: 35.0, bottom: 15.0),
      //             child: Text('Choose Ice Cream Flvaour: ',
      //                 style:
      //                 TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      //           ),
                GestureDetector(
                  onTap: (){
                    widget.choosenway(isSwitched);                    
                  },
                  child: ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: widget.option,
                    activeBgColor: Colors.pink,
                    activeFgColor: Colors.black,
                    // activeTextColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    // inactiveTextColor: Colors.grey[900],
                    inactiveFgColor: Colors.white,
                    labels: ['HOUR', 'DAY'],
                    onToggle: (index) {
                      // changeway(index);
                      // choosenway(index)
                      isSwitched=index;
                      // widget.choosenway(index);//passing index to back page 
                      print('switched to: $index');
                    },
                  ),
                ),
      //         ],
      //       ),              
                    
//       FlutterSwitch(
//      height: 30.0,
//      width: 70.0,
//      padding: 4.0,
//      toggleSize: 25.0,
//      borderRadius: 20.0,
//      activeColor: Colors.indigo,
       
//      value: isSwitched,
//      onToggle: (value) {
//           setState(() {
//                 isSwitched = value;
//           });
//      },
// ),
        //  Switch(
        //       value: isSwitched,
        //       onChanged: (value) {
        //         setState(() {                
        //           isSwitched = value;
        //           print(isSwitched.toString() + " $value ");
        //         });
        //       },            
              
        //       activeTrackColor: Colors.indigo,
        //       activeColor: Colors.orangeAccent,
        //     ),
      ),
    );
  }
}