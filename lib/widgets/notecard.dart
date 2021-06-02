import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/model/notemodel.dart';

class NoteCard extends StatelessWidget {
  final index;
  final NoteModel note;

  const NoteCard({this.index, this.note});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffFFCB35), borderRadius: BorderRadius.circular(10)),
        //  height: 135,
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
              padding: EdgeInsets.fromLTRB(13, 13, 13, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.varelaRound(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Text(
                    note.date,
                    style: GoogleFonts.varelaRound(
                      color: Colors.black38,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
