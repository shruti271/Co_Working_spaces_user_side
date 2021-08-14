// import 'package:coworking_space/space_cart/widgets/category.dart';
import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

class Category{
   int id; 
   String name;
   List<String> placeSearchProperty;
   String img;
   
  
  Category({
    @required this.id,
    @required this.name,
    @required this.placeSearchProperty,
    @required this.img
  });

  Category.fromMap(Map<String, dynamic> data){
    id=data['id'];
    name=data['name'];
    placeSearchProperty=data['sub_type'];
    img=data['image'];
   }
}

class CategoryNotifier with ChangeNotifier{
 List<Category> _myCat=[
   Category(id: 1,name: "office",placeSearchProperty: ["near metro","private cabin","desk","24 * 4"],img: "imgs/o6.jpg"),
   Category(id: 1,name: "meeting space",placeSearchProperty: ["<5","6 to 15 seat",">16 seat","projector/LED","free coffee/tea"],img: "imgs/o7.jpg"),
 ];

 // ignore: unused_field
 Category _currentcat ;

void addCategory(String name,List<String> property,String img)
{
 
 print(name);print(property);print(img);
    _myCat.add(Category(id: 4, name: name, placeSearchProperty: property.toList(), img: img));
    print("hello..........................");
    notifyListeners();
}

 set currentcat(Category cat){
   _currentcat=cat;
   notifyListeners();
 }
 
  List<Category> get myCat {
    return [..._myCat];
  }

  int get itemCount {
    return _myCat.length;
  }

}


