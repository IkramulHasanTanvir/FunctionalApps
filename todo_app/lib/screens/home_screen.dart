import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/add_new_task.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('myBox');
  Database database = Database();
  final TextEditingController _addNewTaskTEController = TextEditingController();

  @override
  void initState() {
    if(_myBox.get('TODOLIST') == null){
      database.createInitialData();
    }else{
      database.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T O D O'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapTOAlertDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: database.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: database.toDoList[index][0],
              taskCompleted: database.toDoList[index][1],
              onChanged: (value) => _onTapToChangeTask(value, index),
              onTapToDelete: (context) => _onTapToDeleteTask(index),
            );
          }),
    );
  }

  void _onTapTOAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNewTask(
            controller: _addNewTaskTEController,
            onSave: _onTapToSaveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void _onTapToChangeTask(bool? value, int index) {
    database.toDoList[index][1] = !database.toDoList[index][1];
    setState(() {});
    database.updateDatabase();
  }

  void _onTapToSaveNewTask() {
    database.toDoList.add([_addNewTaskTEController.text, false]);
    _addNewTaskTEController.clear();
    Navigator.pop(context);
    setState(() {});
    database.updateDatabase();
  }

  void _onTapToDeleteTask(int index) {
    database.toDoList.removeAt(index);
    setState(() {});
    database.updateDatabase();
  }

  @override
  void dispose() {
    _addNewTaskTEController.dispose();
    super.dispose();
  }
}
