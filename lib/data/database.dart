import 'package:hive/hive.dart';
import 'package:to_do/models/task_model.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  //Primeira inicialização do app
  void createInitialData() {
    toDoList = [Task(name: "Sua primeira tarefa", isDone: false)];
  }

  //Load Database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //Update Database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
