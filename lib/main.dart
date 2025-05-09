import 'package:flutter/material.dart';
import 'package:taskr/screens/login_screen.dart';

void main() {
    runApp(TaskManagerApp());
}



class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}