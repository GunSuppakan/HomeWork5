import 'package:flutter/material.dart';
import 'package:homework5/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
          elevation: 3,
          child: ListTile(
            onTap: () {
              onToDoChanged(todo);
            },
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.blue,
            ),
            title: Text(
              todo.todoText!,
              style: TextStyle(
                color: Colors.black,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 0),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  onDeleteItem(todo.todoText);
                },
              ),
            ),
          )
      ),
    );
  }
}
