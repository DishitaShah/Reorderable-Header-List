
class MenuDetails {

  int id;

  int priority;

  String foodName;


  MenuDetails({this.id, this.priority, this.foodName});

  factory MenuDetails.fromJson(Map<String, dynamic> parsedJson){
    return MenuDetails(
        id: parsedJson['id'],
      priority: parsedJson['priority'],
      foodName: parsedJson['foodName']
    );
  }
}
