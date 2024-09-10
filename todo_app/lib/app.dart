import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        dialogBackgroundColor: Colors.orange.shade200,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.orange.shade300),
        scaffoldBackgroundColor: Colors.orange.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange.shade500,
        ),
      ),
    );
  }
}
