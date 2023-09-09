import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_reorderableheaderlist/models/menu.dart';
import 'package:flutter_reorderableheaderlist/models/menu_list.dart';
import 'package:flutter_reorderableheaderlist/reorderablelist_with_header.dart';

class FoodLists extends StatefulWidget {
  @override
  _FoodListsState createState() => _FoodListsState();
}

class _FoodListsState extends State<FoodLists> {
  MenuList listMenu;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/list.json');
    var jsonResponse = await json.decode(response);
    listMenu = new MenuList.fromJson(jsonResponse);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Reorderable ListView Demo"),

            ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(future: readJson(), builder:  (ctx, snapshot)   {
          if (snapshot.connectionState == ConnectionState.done) {
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: listMenu.menu.map((element) {
                    return Container(
                      child: ReorderableListViewWithHeaders(
                        singleCase: element,
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },),
      )
    );
  }
}
