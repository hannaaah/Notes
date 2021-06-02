import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes/controllers/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/dialogbox.dart';

// ignore: must_be_immutable
class NewNote extends StatelessWidget {
  final titlecontroller = TextEditingController(text: Get.parameters['title']);
  final bodycontroller = TextEditingController(text: Get.parameters['body']);

  final bool isEdit = Get.parameters['body'] != null;

  final int index =
      Get.parameters['index'] == null ? 0 : int.parse(Get.parameters['index']);

  NoteController controller = NoteController();

  onBack() {
    if ((bodycontroller.text == Get.parameters['body'] &&
            titlecontroller.text == Get.parameters['title']) ||
        bodycontroller.text == "")
      Get.back();
    else {
      final save = Dialogbox(
          canceltext: "DISCARD",
          confirmtext: "SAVE",
          middletext: "Hey, You like to save the Note?",
          onconfirm: () {
            if (isEdit) controller.delNote(index);
            controller.addNote(titlecontroller.text, bodycontroller.text);
            Get.back();
            Get.back();
          });
      save.dialogBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff222122),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 7),
            child: IconButton(
              splashColor: Color(0xff222122),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 19,
                color: Colors.white70,
              ),
              onPressed: () {
                onBack();
              },
            ),
          ),
          actions: isEdit
              ? ([
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.white70,
                      ),
                      onPressed: () {
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
                  )
                ])
              : null,
        ),
        backgroundColor: Color(0xff222122),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              color: Color(0xffFFD335),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowGlow();
                    return;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                            wordSpacing: 4,
                            fontSize: 17,
                          ),
                          keyboardType: TextInputType.multiline,
                          minLines: 13,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write something here...",
                              hintStyle: TextStyle(
                                fontSize: 17,
                              )),
                          cursorHeight: 25,
                          cursorColor: Colors.grey[800],
                          cursorWidth: 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
