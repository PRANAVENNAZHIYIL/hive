import 'package:flutter/material.dart';
import 'package:hive_flutterdemo/functions/db_functions.dart';
import 'package:hive_flutterdemo/widget/add_studentwidget.dart';
import 'package:hive_flutterdemo/widget/list_student_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.man),
          title: const Text("Student Details"),
        ),
        body: SafeArea(
            child: Column(
          children: const [
            AddStudentWidget(),
            Expanded(child: ListStudentWidget())
          ],
        )));
  }
}
