import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/service/todo_service.dart';
import 'package:todo_list/ui/home_screen.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();

  var _todo = TodoModel();
  var _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextField(
                controller: _title,
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: "Write Your Title",
                    icon: Icon(
                      Icons.title,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: TextField(
                controller: _desc,
                decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(color: Colors.blue),
                    hintText: "Add Your Description",
                    icon: Icon(
                      Icons.description,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton.icon(
                    onPressed: () async {
                      _todo.title = _title.text;
                      _todo.desc = _desc.text;
                      var result = await _todoService.saveTodo(_todo);
                      return(result);
                    },
                    icon: Icon(Icons.check),
                    label: Text("Add")),
                RaisedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    label: Text("Cancel"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
