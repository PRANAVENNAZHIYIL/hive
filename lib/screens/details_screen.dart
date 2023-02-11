import 'package:flutter/material.dart';

import '../model/data_mpdel.dart';

class DetailPage extends StatelessWidget {
  final StudentModel datas;
  const DetailPage({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name :${datas.name}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Age :${datas.age}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Gender :${datas.gender}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Qualifiction :${datas.education}",
                style: const TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        // child: ValueListenableBuilder(
        //   builder: (BuildContext context, datass, Widget? _) {
        //     return ListView.separated(
        //         itemBuilder: (ctx, index) {
        //           final datass = datas;
        //           return Column(
        //             children: [
        //               ListTile(
        //                 leading: const CircleAvatar(
        //                   child: Icon(Icons.man),
        //                 ),
        //                 title: Text(datass.name),
        //                 subtitle: Text(datass.age),
        //               ),
        //               Text(datass.gender),
        //               Text(datass.education),
        //             ],
        //           );
        //         },
        //         separatorBuilder: (ctx, index) {
        //           return const Divider();
        //         },
        //         itemCount: 1);
        //   },
        //   valueListenable: studentListNotifier,
        // ),
      ),
    ); //
  }
}
