import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space/category_wise_detail/cat_place.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryOfPlace extends StatefulWidget {  
  const CategoryOfPlace({
    Key key,
  }) : super(key: key);

  @override
  _CategoryOfPlaceState createState() => _CategoryOfPlaceState();
}

class _CategoryOfPlaceState extends State<CategoryOfPlace> {
  
  @override
  void initState() { 
    // CategoryNotifier curcat =Provider.of<CategoryNotifier>(context,listen: false);
      // CategoryNotifier curcat =Provider.of<CategoryNotifier>(context,listen: false);
    // getcategory(curcat,context);

    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    // CategoryNotifier curcat =Provider.of<CategoryNotifier>(context);
    // getcategory(curcat,context);
    CollectionReference placecat = Firestore.instance.collection('place_category');

    return Column(
      children: [
        Text("category",style: TextStyle(fontWeight: FontWeight.bold),),
        
         
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 150,
            width: MediaQuery. of(context). size. width,
            child: StreamBuilder<QuerySnapshot>(
              stream: placecat.snapshots(),
              builder: (context, snapshot) {
                 if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
          // itemCount:snapshot.toString().length.toInt(),
          itemCount:2,          
          itemBuilder: (context,int index){
            return CategoryCard(
                        catinfo: snapshot.data.documents[index],
                        routeName: CategoryWiseProductPage.routeName,                          
                          );
          }
                );          
              }),
          ),    
        ),
        ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.catinfo,
    @required this.routeName
  }) : super(key: key);

  
  final String routeName;
  final DocumentSnapshot catinfo;

  @override
  Widget build(BuildContext context) {
    return SpecialOfferCard(
      image: catinfo['img'],
      category: catinfo['name'],
      numOfBrands: 18,
      press: () {
        if(selectedLocation.isNotEmpty)            
            Navigator.pushNamed(context,routeName,arguments:{'SpaceCategory':catinfo,'cat_id':catinfo.documentID});            
        else
           {             
             // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(SnackBar(  
            content: Text('city must be choosen.!!! '),  
            duration: Duration(seconds: 5),  
            action: SnackBarAction(  
              label: 'use default',  
              onPressed: () {  
                // Some code to undo the change.  
                selectedLocation="surat";
              },  
            ),  
          ),);  
           }
        
      },
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          // width: getProportionateScreenWidth(140),
          // height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}