import 'package:flutter/material.dart';
import 'package:hive_flutterdemo/functions/db_functions.dart';

import '../model/data_mpdel.dart';
import '../screens/details_screen.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder:
          (BuildContext context, List<StudentModel> studentModel, Widget? _) {
        return ListView.separated(
          itemBuilder: (ctx, int index) {
            final data = studentModel[index];
            return Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.man),
                  ),
                  title: Text(
                    data.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle:
                      Text(data.age, style: const TextStyle(fontSize: 16)),
                  trailing: IconButton(
                      onPressed: () {
                        deleteStudents(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        datas: data,
                                      )));
                        },
                        child: const Text("More Details"))
                  ],
                )
              ],
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentModel.length,
        );
      },
      valueListenable: studentListNotifier,
    ); //
  }
}
