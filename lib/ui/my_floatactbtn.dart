import 'package:flutter/material.dart';
import 'package:todo_list/ui/todo.dart';

class MyFloatingActionBtn extends StatefulWidget {
  @override
  _MyFloatingActionBtnState createState() => _MyFloatingActionBtnState();
}

class _MyFloatingActionBtnState extends State<MyFloatingActionBtn> {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Todo()));
        });
  }
}