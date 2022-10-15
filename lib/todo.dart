class ToDo{
  String? todoText;
  late bool isDone;

  ToDo({
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo>todoList(){
    return[
      ToDo(todoText: 'ทำการบ้านครั้งที่ 4 วิชา Mobile App Dev'),
      ToDo(todoText: 'ทำการบ้านครั้งที่ 5 วิชา Mobile App Dev'),
      ToDo(todoText: 'ทำโปรเจ็ค วิชา Mobile App Dev'),
    ];
  }


}