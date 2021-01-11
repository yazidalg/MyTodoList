import 'package:todo_list/dbhelper/repository.dart';
import 'package:todo_list/model/todo_model.dart';

class TodoService {
  Repository _repository;

  //Initialize
  TodoService(){
    _repository = Repository();
  }

  saveTodo(TodoModel todoModel) async {
    return await _repository.insertData('todo', todoModel.todoMap());
  }

  readTodo() async {
    return await _repository.readData('todo');
  }
}
