import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/widgets/notecard.dart';
import '../widgets/icon.dart';

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
              style: GoogleFonts.varelaRound(fontSize: 20),
            ),
          ),
          backgroundColor: Color(0xff222122),
        ),
        backgroundColor: Color(0xff222122),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
              valueListenable: noteBox.listenable(),
              builder: (context, noteBox, _) {
                if (noteBox.values.isEmpty)
                  return Center(
                      child: Text("No notes to display!",
                          style: GoogleFonts.varelaRound(
                            color: Colors.grey[700],
                          )));
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
        floatingActionButton: IconWidget(
            icon: Icons.add_rounded,
            onpressed: () {
              Get.toNamed("Newnote");
            }));
  }
}
