import 'package:flutter_reorderableheaderlist/models/menu.dart';

class MenuList {
  final List<Menu> menu;

  MenuList({
    this.menu,
  });

  factory MenuList.fromJson(List<dynamic> parsedJson) {

    List<Menu> menus = [];
    menus = parsedJson.map((i)=>Menu.fromJson(i)).toList();

    return new MenuList(
        menu: menus
    );
  }
}