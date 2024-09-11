import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/add_new_dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('myBox');
  Database database = Database();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  final TextEditingController _addNewTaskTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapToShowAlertDialog,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: database.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: database.toDoList[index][0],
              taskCompleted: database.toDoList[index][1],
              onChanged: (value) => _onTapToChangeTask(value, index),
              deleteFunction: (context) => _onTapToDeleteTask(index),
            );
          }),
    );
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

  void _onTapToShowAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNewDialogBox(
            controller: _addNewTaskTEController,
            onSave: _onTapToSaveNewTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  @override
  void dispose() {
    _addNewTaskTEController.dispose();
    super.dispose();
  }
}
