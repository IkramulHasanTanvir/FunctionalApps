import 'package:flutter/material.dart';
import 'package:todo_app/util/add_new_dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _addNewTaskTEController = TextEditingController();

  final List _toDoList = [
    ['Make Tutorial', false],
    ['Do Exercise', false],
  ];

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
          itemCount: _toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: _toDoList[index][0],
              taskCompleted: _toDoList[index][1],
              onChanged: (value) => _onTapToChangeTask(value, index),
              deleteFunction: (context) => _onTapToDeleteTask(index),
            );
          }),
    );
  }

  void _onTapToChangeTask(bool? value, int index) {
    _toDoList[index][1] = !_toDoList[index][1];
    setState(() {});
  }

  void _onTapToSaveNewTask() {
    _toDoList.add([_addNewTaskTEController.text, false]);
    _addNewTaskTEController.clear();
    Navigator.pop(context);
    setState(() {});
  }

  void _onTapToDeleteTask(int index) {
    _toDoList.removeAt(index);
    setState(() {});
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
