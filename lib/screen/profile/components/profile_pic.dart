// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// // import 'package:image';
// // import 'package:flutter_svg/flutter_svg.dart';

// // class ProfilePic extends StatelessWidget {
// //   const ProfilePic({
// //     Key key,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 115,
// //       width: 115,
// //       child: Stack(
// //         fit: StackFit.expand,
// //         overflow: Overflow.visible,
// //         children: [
// //           CircleAvatar(
// //             backgroundImage: AssetImage("assets/images/Profile Image.png"),
// //           ),
// //           Positioned(
// //             right: -16,
// //             bottom: 0,
// //             child: SizedBox(
// //               height: 46,
// //               width: 46,
// //               child: FlatButton(
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(50),
// //                   side: BorderSide(color: Colors.white),
// //                 ),
// //                 color: Color(0xFFF5F6F9),
// //                 onPressed: () {
                    
// //                 },
// //                 child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// class ProfilePage extends StatefulWidget {
//   ProfilePage({Key key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File _pickedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//             child: CircleAvatar(
//               radius: 80,
//               child: _pickedImage == null ? Text("Picture") : null,
//               backgroundImage:
//                   _pickedImage != null ? FileImage(_pickedImage) : null,
//             ),
//             );
//           // ignore: dead_code
//           SizedBox(height: 10.0);
//           RaisedButton(
//             child: Text("Pick Image"),
//             onPressed: () {
//               _showPickOptionsDialog(context);
//             },
//           );
//     //     ],
//     //   ),
//     // );
//   }

//   _loadPicker(ImageSource source) async {
//     File picked = await ImagePicker.pickImage(source: source);
//     if (picked != null) {
//       _cropImage(picked);
//     }
//     Navigator.pop(context);
//   }

//   _cropImage(File picked) async {
//     File cropped = await ImageCropper.cropImage(
//       androidUiSettings: AndroidUiSettings(
//         statusBarColor: Colors.red,
//         toolbarColor: Colors.red,
//         toolbarTitle: "Crop Image",
//         toolbarWidgetColor: Colors.white,
//       ),
//       sourcePath: picked.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio16x9,
//         CropAspectRatioPreset.ratio4x3,
//       ],
//       maxWidth: 800,
//     );
//     if (cropped != null) {
//       setState(() {
//         _pickedImage = cropped;
//       });
//     }
//   }

//   void _showPickOptionsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               title: Text("Pick from Gallery"),
//               onTap: () {
//                 _loadPicker(ImageSource.gallery);
//               },
//             ),
//             ListTile(
//               title: Text("Take a pictuer"),
//               onTap: () {
//                 _loadPicker(ImageSource.camera);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

