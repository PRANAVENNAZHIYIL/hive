import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/data_mpdel.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  studentDb.add(value);
  //value.id = id;

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudents(int index) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  await studentDb.deleteAt(index);
  getAllStudents();
  studentListNotifier.notifyListeners();
}
