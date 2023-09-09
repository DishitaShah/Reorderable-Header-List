import 'package:flutter/foundation.dart';
import 'package:flutter_reorderableheaderlist/models/menu_details.dart';


class Menu {
  String foodType;
  List<MenuDetails> food;

  Menu({@required this.foodType, @required this.food});
  factory Menu.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['food'] as List;
    print(list.runtimeType);
    List<MenuDetails> foodList = list.map((i) => MenuDetails.fromJson(i)).toList();


    return Menu(
        foodType: parsedJson['foodType'], food: foodList,
    );
  }
}
