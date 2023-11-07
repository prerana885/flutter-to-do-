import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList =[];


  final _myBox = Hive.box('myBox');
void createInitialData(){
toDoList = [
  ["make series",false],
  ["do gym", false],
];
}
void loadData(){
  toDoList= _myBox.get("TODOLIST");

}
void updateDataBase(){
_myBox.put("TODOLIST", toDoList);
}
}