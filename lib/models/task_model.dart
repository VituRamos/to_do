import 'package:hive/hive.dart';
part 'task_model.g.dart'; 

@HiveType(typeId: 1) // Cada classe tem um ID único
class Task {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isDone;

  Task({required this.name, required this.isDone});
}