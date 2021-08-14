
import 'package:coworking_space/components/coustom_bottom_nav_bar.dart';
import 'package:coworking_space/constants.dart';
import 'package:coworking_space/enums.dart';
import 'package:coworking_space/screen/profile/msgmodel.dart';
import 'package:flutter/material.dart';

// List<String> recipents = ["7069354400", "8128613937"];

// void _sendSMS(String message, List<String> recipents) async {
//   String _result = await sendSMS(message: message, recipients: recipents)
//       .catchError((onError) {
//     print(onError);
//   });
//   print(_result);
// }



class ChatDetailPage extends StatefulWidget{
 static String routeName = "/msg";
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
 String _textString =" jnu";
List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hello Users , How are you ?", messageType: "sender"),
    ChatMessage(messageContent: "May I hep you ? ", messageType: "receiver"),
    ChatMessage(messageContent: "If Any query ask question here ..................", messageType: "sender"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                // IconButton(
                //   onPressed: (){
                //     Navigator.pop(context);
                //   },
                //   icon: Icon(Icons.arrow_back,color: Colors.black,),
                // ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundImage: NetworkImage("<https://randomuser.me/api/portraits/men/5.jpg>"),
                  backgroundColor: kPrimaryColor,
                  maxRadius: 20,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Admin",style: TextStyle( fontSize: 18 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      // Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                // Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
    
      body: Stack(
        // backgroundColor: Colors.black,
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                child: Text(messages[index].messageContent),
              );
            },
          ),
           Text(
              _textString,
              style: TextStyle(fontSize: 30),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  // GestureDetector(
                  //   onTap: (){

                  //   },
                  //   child: Container(
                  //     height: 30,
                  //     width: 30,
                  //     decoration: BoxDecoration(
                  //       color: kPrimaryColor,
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: Icon(Icons.add, color: Colors.white, size: 20, ),
                  //   ),
                  // ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                             _doSomething();
                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor:kPrimaryColor,
                    elevation: 0,
                  ),
                ], 
              ),
            ),
          ),
        ],
      ),
       bottomNavigationBar:
              CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
    void _doSomething() {
        // Using the callback State.setState() is the only way to get the build
        // method to rerun with the updated state value.
        setState(() {
          _textString = 'Hello Flutter';
        });
      }
    
}