import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/dialogbox.dart';
import 'widgets/icon.dart';

class NewNote extends StatelessWidget {
  final TextEditingController titlecontroller =
      TextEditingController(text: Get.parameters['title']);
  final TextEditingController bodycontroller =
      TextEditingController(text: Get.parameters['body']);

  final bool isEdit = Get.parameters['body'] != null;

  final int index = (Get.parameters['index'] == null)
      ? 0
      : int.parse(Get.parameters['index']);

  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff222122),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 7),
          child: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              size: 18.5,
              color: Colors.white70,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                  child: Text(
                    "SAVE",
                    style: GoogleFonts.aBeeZee(
                        color: Color(0xffFFD338), fontSize: 18),
                  ),
                  onPressed: () {
                    final save = Dialogbox(
                      canceltext: "DISCARD",
                      confirmtext: "SAVE",
                      middletext: "Do you want to save the Note?",
                      onconfirm: () {
                        if (isEdit) controller.delNote(index);
                        controller.addNote(
                            titlecontroller.text, bodycontroller.text);
                        Get.back();
                        Get.back();
                      },
                    );
                    save.dialogBox();
                  }))
        ],
      ),
      backgroundColor: Color(0xff222122),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            height: 355,
            color: Color(0xffFFD338),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titlecontroller,
                    textCapitalization: TextCapitalization.sentences,
                    style: GoogleFonts.varelaRound(fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Title",
                        hintStyle: TextStyle(fontSize: 25)),
                    cursorColor: Colors.grey[800],
                    cursorWidth: 1.5,
                    cursorHeight: 31,
                  ),
                  TextField(
                    controller: bodycontroller,
                    textCapitalization: TextCapitalization.sentences,
                    style: GoogleFonts.varelaRound(
                      fontSize: 17,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter description here...",
                        hintStyle: TextStyle(
                          fontSize: 17,
                        )),
                    cursorHeight: 25,
                    cursorColor: Colors.grey[800],
                    cursorWidth: 1.5,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: IconWidget(
        icon: Icons.delete_outline,
        onpressed: () {
          final del = Dialogbox(
              canceltext: "NO",
              confirmtext: "YES",
              middletext: "Are you sure you want to delete?",
              onconfirm: () {
                controller.delNote(index);
                Get.back();
                Get.back();
              });
          del.dialogBox();
        },
      ),
    );
  }
}
