import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/model/notemodel.dart';

// ignore: must_be_immutable
class NoteCards extends StatelessWidget {
  Box<dynamic> noteBox = Hive.box("Notes");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
          valueListenable: noteBox.listenable(),
          builder: (context, noteBox, _) {
            if (noteBox.values.isEmpty)
              return Center();
            else {
              return ListView.builder(
                  itemCount: noteBox.length,
                  itemBuilder: (context, index) {
                    NoteModel note = noteBox.getAt(index);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFFCB35),
                            borderRadius: BorderRadius.circular(10)),
                        height: 135,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                "Newnote?title=${note.title}&body=${note.body}&index=$index");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFCB35),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(13, 13, 13, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    note.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    note.body,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 37,
                                  ),
                                  Text(
                                    note.date,
                                    style: GoogleFonts.varelaRound(
                                        color: Colors.black38,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
