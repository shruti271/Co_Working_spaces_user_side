import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main_rating_wise_pro.dart';

class HomePageRatingView extends StatefulWidget {
  @override
  _HomePageRatingViewState createState() => _HomePageRatingViewState();
}

class _HomePageRatingViewState extends State<HomePageRatingView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "High Rated",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Container(
            
            // height: 300,
            // width: double.infinity,
            child:
             FutureBuilder(
                future: Firestore.instance
                    .collection('places')
                    .orderBy("rating",descending: true)
                    .limit(4)
                    .getDocuments(),
                builder: (context, snapshot) {
                   if (snapshot.hasError) {
          return Text('Something went wrong');
        }
                   if(!snapshot.hasData){
                   return Center(child: CircularProgressIndicator(
                    //  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                   ));
                   }
                  // if (snapshot.hasError) Text("waiting error");
                  else{
                  return Column(
                    children: List.generate(4, (index){
                      print(index);
                      print(">>>>>.....................>>>>>.....................>>>>>....................."+snapshot.data.documents[index].documentID);
                      return Myratingcard(cdata: snapshot.data.documents[index]);
                    }),
                  );
                   
                }
                }
                ),
                    )
          
        ],
      ),
    );
  }
}
