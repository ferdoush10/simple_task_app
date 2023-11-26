import 'package:flutter/material.dart';

import 'home_screen.dart';

//Todo application
// CRUD - create, read, update, delete  

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
