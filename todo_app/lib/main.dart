import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/app.dart';

void main() async {
  await Hive.initFlutter();
  var openBox = await Hive.openBox('myBox');
  runApp(const ToDoApp());
}
