import 'package:flutter/material.dart';
import 'package:flutter_reorderableheaderlist/listviewcard.dart';
import 'package:flutter_reorderableheaderlist/models/menu.dart';

class ReorderableListViewWithHeaders extends StatefulWidget {
  final Menu singleCase;
  @override
  _ReorderableListViewWithHeadersState createState() => _ReorderableListViewWithHeadersState();
  ReorderableListViewWithHeaders({
    Key key,
    this.singleCase,
  }) : super(key: key);

}


class _ReorderableListViewWithHeadersState extends State<ReorderableListViewWithHeaders> {

  List<String> foodNamesList = [];

  @override
  void initState() {
    for(int i=0; i<widget.singleCase.food.length;i++)
    {
      foodNamesList.add(widget.singleCase.food[i].foodName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
           height: (80.0 * foodNamesList.length)+5,
          width: MediaQuery.of(context).size.width,
          child: ReorderableListView(
            physics: NeverScrollableScrollPhysics(),
            header: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Text(widget.singleCase.foodType, style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.left,
                  maxLines: 5),
            ),
              onReorder: _onReorder,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: List.generate(
                widget.singleCase.food.length,
                    (index) {
                  return ListViewCard(
                    foodNamesList,
                    index,
                    Key('$index'),
                  );
                },
              ),
            ),
        ),
      ],
    );

  }
  void _onReorder(int oldIndex, int newIndex) {
    setState(
          () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = foodNamesList.removeAt(oldIndex);
        foodNamesList.insert(newIndex, item);
      },
    );
  }
}
