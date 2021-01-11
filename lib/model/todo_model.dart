class TodoModel{
  int id;
  String title;
  String desc;

  //Json To Map
  todoMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['desc'] = desc;
    return mapping;
  }
}