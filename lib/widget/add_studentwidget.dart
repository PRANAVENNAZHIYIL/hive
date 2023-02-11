import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutterdemo/functions/db_functions.dart';
import 'package:hive_flutterdemo/model/data_mpdel.dart';

class AddStudentWidget extends StatefulWidget {
  const AddStudentWidget({super.key});

  @override
  State<AddStudentWidget> createState() => _AddStudentWidgetState();
}

class _AddStudentWidgetState extends State<AddStudentWidget> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  late SingleValueDropDownController _genderController;

  late SingleValueDropDownController _educationController;

  //final _educationController = TextEditingController();

  @override
  void initState() {
    _genderController = SingleValueDropDownController();
    _educationController = SingleValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _genderController.dispose();
    _educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Age')),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Select your Dender",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            DropDownTextField(
              textFieldDecoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Gender'),
              //initialValue: "gender",
              controller: _genderController,
              clearOption: true,
              // enableSearch: true,
              //dropdownColor: Colors.green,
              //searchDecoration: const InputDecoration(hintText: "Gender"),
              validator: (value) {
                if (value == null) {
                  return "enter your gender here";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 2,

              dropDownList: const [
                DropDownValueModel(name: 'male', value: "value1"),
                DropDownValueModel(
                    name: 'female',
                    value: "value2",
                    toolTipMsg:
                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
              ],
              onChanged: (val) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Education",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            DropDownTextField(
              textFieldDecoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'education'),
              // initialValue: "gender",
              controller: _educationController,
              clearOption: true,
              //enableSearch: true,
              //dropdownColor: Colors.green,
              searchDecoration: const InputDecoration(hintText: "EDucation"),
              validator: (value) {
                if (value == null) {
                  return "enter your gender here";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 5,

              dropDownList: const [
                DropDownValueModel(name: 'highschool', value: "value1"),
                DropDownValueModel(name: 'higher Secondary', value: "value2"),
                DropDownValueModel(
                    name: 'UG',
                    value: "value3",
                    toolTipMsg:
                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                DropDownValueModel(name: 'PG', value: "value4"),
              ],
              onChanged: (val) {},
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                onAddStudentClicked();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Student'),
            ),
          ]),
        ));
  }

  void onAddStudentClicked() {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final gender = _genderController.dropDownValue?.name;
    final education = _educationController.dropDownValue?.name;
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    print("$name,$age,$education,$gender");

    final student = StudentModel(
        name: name, age: age, gender: gender, education: education);
    addStudent(student);
  }
}
