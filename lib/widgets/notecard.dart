import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/model/notemodel.dart';
import 'package:notes/themes/themes.dart';
import 'package:notes/views/new_note.dart';

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
        child: GestureDetector(
          onTap: () {
            Get.to(NewNote(index: index));
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
                  note.title == ""
                      ? SizedBox()
                      : Text(
                          note.title,
                          overflow: TextOverflow.ellipsis,
                          style: Themes.titleStyle,
                        ),
                  note.title == ""
                      ? SizedBox()
                      : SizedBox(
                          height: 10,
                        ),
                  Text(
                    note.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Themes.bodyStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    note.date,
                    style: Themes.dateStyle,
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
