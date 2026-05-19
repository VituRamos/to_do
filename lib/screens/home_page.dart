import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/components/dialog_box.dart';
import 'package:to_do/components/todo_tile.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/models/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  //Hive
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  void initState() {
    print("Conteúdo da Box: ${_mybox.get("TODOLIST")}");

    //1st time
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //Text Controller
  final _controller = TextEditingController();

  //Metodo CheckBox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index].isDone = !db.toDoList[index].isDone;
    });
    db.updateDataBase();
  }

  //Save Task
  void saveNewTask() {
    setState(() {
      db.toDoList.add(Task(name: _controller.text, isDone: false));
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //Delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  //Metodo New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Style
      backgroundColor: Colors.yellow[100],

      //Appbar
      appBar: AppBar(title: Text('To Do')),

      //Body
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index].name,
            isDone: db.toDoList[index].isDone,
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

      //Button
      floatingActionButton: FloatingActionButton(
        //Style
        backgroundColor: Colors.yellow,
        shape: CircleBorder(),
        child: Icon(Icons.add),

        //Onpressed
        onPressed: createNewTask,
      ),
    );
  }
}
