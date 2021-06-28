import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/themes/themes.dart';
import 'package:notes/widgets/icon.dart';
import 'package:notes/widgets/notecard.dart';

class Home extends StatelessWidget {
  Box<dynamic> noteBox = Hive.box("Notes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "NOTES",
              style: Themes.headingStyle,
            ),
          ),
          backgroundColor: Themes.bgColor,
        ),
        backgroundColor: Themes.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
              valueListenable: noteBox.listenable(),
              builder: (context, noteBox, _) {
                if (noteBox.values.isEmpty)
                  return Center(
                      child: Text("No notes to display!",
                          style: Themes.noNoteStyle));
                else
                  return NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return;
                    },
                    child: ListView.builder(
                        itemCount: noteBox.length,
                        itemBuilder: (context, index) {
                          final note = noteBox.getAt(index);
                          return NoteCard(
                            index: index,
                            note: note,
                          );
                        }),
                  );
              }),
        ),
        floatingActionButton: ButttonIcon(
            icon: Icons.add_rounded,
            onpressed: () {
              Get.toNamed("Newnote");
            }).floatingIcon());
  }
}
