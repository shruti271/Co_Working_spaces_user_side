import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Placerating extends StatefulWidget {
  // const Placerating({ Key? key }) : super(key: key);
  final double info;
  Placerating({@required this.info});

  @override
  _PlaceratingState createState() => _PlaceratingState();
}

class _PlaceratingState extends State<Placerating> {
  
  @override
  Widget build(BuildContext context) {
    print(widget.info.toString()+"{{{{{{{{{{{{{{{{{{{>>>>>>>>>><<<<<<<<<");
    return  Container(
      
      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarIndicator(
    rating: widget.info,
    itemBuilder: (context, index) => Icon(
         Icons.star,
         color: Colors.amber,
    ),
    itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
    itemCount: 5,
    itemSize: 35.0,
    direction: Axis.horizontal,
),
                // RatingBar(
                //                     initialRating: widget.info['rate'].todouble(),
                //                     minRating: 0,
                //                     direction: Axis.horizontal,
                //                     allowHalfRating: true,
                //                     itemCount: 5,
                //                     itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                //                       ratingWidget: RatingWidget(
                //                               full: Icon(Icons.star),
                //                               half: Icon(Icons.star_half),
                //                               empty:  Icon(Icons.star_border),
                //                             ),
                //                     //  itemBuilder: (context, _) => Icon(
                //                     //    Icons.star,
                //                     //    color: Colors.amber,
                //                     //  ),
                //                     updateOnDrag: true,
                //                     onRatingUpdate: (rating) async {
                //                       print(rating);
                //                       setState(() {
                //                                   // rate=rating;
                //                       });
                                        
                //                     },
                //                   ),
              ],
  
                  
      ),
        );  
  }
}