import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/todo_service.dart';
import 'package:todo_list/ui/my_floatactbtn.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var _todo = TodoModel();
  var _todoService = TodoService();

  List<TodoModel> _listTodo = List<TodoModel>();

  @override
  void initState() {
    super.initState();
    getAllTodo();
  }

  getAllTodo() async {
    _listTodo = List<TodoModel>();
    var todo = await _todoService.readTodo();
    todo.forEach((_todo) {
      setState(() {
        var todoModel = TodoModel();
        todoModel.title = todo['title'];
        todoModel.desc = todo['desc'];
        todoModel.id = todo['id'];
        _listTodo.add(todoModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: ListView.builder(
          itemCount: _listTodo.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
                title: Row(
                  children: <Widget>[
                    Text(_listTodo[index].title),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: MyFloatingActionBtn());
  }
}
