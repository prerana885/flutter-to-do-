import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main2/Dialog_Box.dart';
import 'package:main2/database.dart';
import '../todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox=Hive.box('myBox');
  ToDoDataBase db =ToDoDataBase();
  void initState() {
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }


    super.initState();
  }
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void CreateNewTask() {
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
  void deletetask(int index){
    setState(() {
      db.toDoList.remove(index);
      db.updateDataBase();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.toDoList[index][0],
            taskcompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            DeleteFunction: (BuildContext) {},
          );
        },
      ),
    );
  }
}
