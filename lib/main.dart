import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/screens/home_page.dart';

void main() async {
  //Hive init
  await Hive.initFlutter();

  //Task Adapter
  Hive.registerAdapter(TaskAdapter());
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),

      //Theme
      theme: ThemeData(
        //General
        primarySwatch: Colors.yellow,

        //AppBar Theme
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}
