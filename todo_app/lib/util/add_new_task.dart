import 'package:flutter/material.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask(
      {super.key,
      this.controller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController? controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ADD NEW'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Add new task'),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSave,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
