import 'package:flutter/material.dart';
import 'package:homework5/pages/todo_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const My_ToDo(),
    );
  }
}

