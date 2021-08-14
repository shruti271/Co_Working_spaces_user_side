// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';


// class Database{
//   static final Firestore _db =Firestore.instance;


//   Future < void > addStudent() async {  
//     await _db.collection("students").add({  
//         'name': "abc",  
//         'age': 1,  
//     }).then((documentReference) {  
//         print(documentReference.documentID);  
//         // clearForm();  
//     }).catchError((e) {  
//         print(e);  
//     });  
// }  

// Future < void > editStudent(docIdToUpdate) async {  
//     await _db.collection("students").document(docIdToUpdate).updateData({  
//         'name': "def",  
//         'age': 2,  
//     }).then((documentReference) {  
//         // clearForm();  
//     }).catchError((e) {  
//         print(e);  
//     });  
// }
  
//   Future<void> deleteStudent(DocumentSnapshot doc) async {  
//    _db.collection("students").document(doc.documentID).delete();  
//   //  clearForm();  
// }

// }





// class MyHomePage extends StatelessWidget {
// const MyHomePage({Key key, this.title}) : super(key: key);

// final String title;

// Widget _buildListItem(BuildContext context, DocumentSnapshot document ){
// return ListTile(
// title: Row(
// children: [

// Expanded(
// child: Text(
// document['name'],
// // style: Theme.of(context).textTheme.headline,
// ),
// ),
// Container(
// decoration: const BoxDecoration(
// color: Color(0xffdd),
// ),
// padding: const EdgeInsets.all(10.0),
// child: Text(
// document['votes'].toString(),
// // style: Theme.of(context).textTheme.display1,

// ),
// ),
// ],
// ),

// onTap: (){
// //print("should increase vots here");
// document.reference.updateData({
// 'votes': document['votes'] + 1
// }

// );
// },
// );
// }

// @override
// Widget build(BuildContext context) {

// return Scaffold(
// appBar: AppBar(

// title: Text(title),
// ),
// body: StreamBuilder(

// stream: Firestore.instance.collection('carnames').snapshots(),
// builder: (context, snapshot){

// if(!snapshot.hasData) return const Text('loading....');
// return ListView.builder(
// itemExtent: 80.0,
// itemCount: snapshot.data.documents.length,
// itemBuilder: (context, index) =>
// _buildListItem(context, snapshot.data.documents[index]),
// );
// }

// // This trailing comma makes auto-formatting nicer for build methods.
// ),
// );
// }
// }