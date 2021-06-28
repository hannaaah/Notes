import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:notes/controllers/note_controller.dart';
import 'package:notes/model/notemodel.dart';
import 'package:notes/themes/themes.dart';
import 'package:notes/widgets/icon.dart';
import '../widgets/dialogbox.dart';

class NewNote extends StatelessWidget {
  NoteModel note;
  int index;
  bool toEdit;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController bodycontroller = TextEditingController();

  NoteController controller = Get.put(NoteController());

  NewNote({this.index}) {
    toEdit = (index != null);
    if (toEdit) {
      note = controller.getNote(index);
      titlecontroller.text = note.title;
      bodycontroller.text = note.body;
    }
  }

  saveNote() {
    Dialogbox(
        canceltext: "DISCARD",
        confirmtext: "SAVE",
        middletext: "Hey, You like to save the Note?",
        onconfirm: () {
          if (toEdit) controller.delNote(index);
          controller.addNote(titlecontroller.text, bodycontroller.text);
          Get.back();
          Get.back();
        }).dialogBox();
  }

  deleteNote() {
    Dialogbox(
        canceltext: "NO",
        confirmtext: "YES",
        middletext: "Are you sure you want to delete?",
        onconfirm: () {
          controller.delNote(index);
          Get.back();
          Get.back();
        }).dialogBox();
  }

  onBack() {
    if (toEdit) {
      note = controller.getNote(index);
      if (titlecontroller.text == note.title &&
          bodycontroller.text == note.body)
        Get.back();
      else if (bodycontroller.text == "" && titlecontroller.text == "") {
        controller.delNote(index);
        Get.back();
      } else
        saveNote();
    } else if (bodycontroller.text == "" && titlecontroller.text == "")
      Get.back();
    else
      saveNote();
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
          backgroundColor: Themes.bgColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 7),
            child: ButttonIcon(
              icon: Icons.arrow_back_ios,
              size: 20,
              onpressed: () {
                onBack();
              },
            ).appbarIcons(),
          ),
          actions: toEdit
              ? ([
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: ButttonIcon(
                      icon: Icons.delete_outline_outlined,
                      onpressed: () {
                        deleteNote();
                      },
                    ).appbarIcons(),
                  )
                ])
              : null,
        ),
        backgroundColor: Themes.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              color: Themes.noteCardColor,
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
                          style: Themes.titleStyle,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Title",
                              hintStyle: Themes.titleStyle),
                          cursorColor: Colors.grey[800],
                          cursorWidth: 1.5,
                          cursorHeight: 31,
                        ),
                        TextField(
                          controller: bodycontroller,
                          textCapitalization: TextCapitalization.sentences,
                          style: Themes.editBodyStyle,
                          keyboardType: TextInputType.multiline,
                          minLines: 13,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Write something here...",
                              hintStyle: Themes.editBodyStyle),
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
