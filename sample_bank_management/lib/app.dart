import 'package:flutter/material.dart';
import 'package:sample_bank_management/screens/home_screen.dart';

class BankManagement extends StatelessWidget {
  const BankManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
