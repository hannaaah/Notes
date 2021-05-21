import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes/model/dialogbox.dart';
import 'package:notes/model/icon.dart';
import 'package:notes/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';

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
        backgroundColor: Color(0xff313131),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                  child: Text(
                    "SAVE",
                    style: GoogleFonts.aBeeZee(
                        color: Color(0xffFFD346), fontSize: 18),
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
                        Get.snackbar("", "",
                            backgroundColor: Colors.white30,
                            titleText: Text(
                              "New Note ",
                              style: GoogleFonts.varelaRound(fontSize: 17),
                            ),
                            messageText: Text("Your note has been saved.",
                                style: GoogleFonts.varelaRound(
                                    fontSize: 13, color: Colors.grey[900])));
                      },
                    );
                    save.dialogBox();
                  }))
        ],
      ),
      backgroundColor: Color(0xff313131),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            height: 350,
            color: Color(0xffFFD338),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: titlecontroller,
                    textCapitalization: TextCapitalization.sentences,
                    style: GoogleFonts.varelaRound(fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
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
                        hintText: "Write description here...",
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
              middletext: "Are you sure that you want to delete?",
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
