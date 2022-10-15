import 'package:flutter/material.dart';
import 'package:homework5/todo.dart';
import 'package:homework5/todo_item.dart';

class My_ToDo extends StatefulWidget {
  const My_ToDo({Key? key}) : super(key: key);

  @override
  State<My_ToDo> createState() => _My_ToDoState();
}

class _My_ToDoState extends State<My_ToDo> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.check_box, color: Colors.white,),
        title: Text('My ToDo'),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [
                        Container(margin: EdgeInsets.all(8)),
                        for (ToDo todoo in todoList)
                          ToDoItem(
                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Enter new ToDo',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            )),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                    right: 20.0,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String todoText) {
    setState(() {
      todoList.removeWhere((item) => item.todoText == todoText);
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todoList.add(ToDo(todoText: todo));
    });
    _todoController.clear();
  }
}
