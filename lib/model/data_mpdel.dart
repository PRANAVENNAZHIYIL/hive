import 'package:hive_flutter/hive_flutter.dart';

part 'data_mpdel.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  Future<int>? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final dynamic gender;
  @HiveField(4)
  final dynamic education;

  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.education,
  });
}
