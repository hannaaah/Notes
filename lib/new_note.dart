import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/note_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNote extends StatelessWidget {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController bodycontroller = TextEditingController();

  final NoteModel note = Get.arguments;

  final controller = Get.find<NoteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff313131),
        actions: [
          // ignore: unrelated_type_equality_checks
          bodycontroller.text == null
              ? SizedBox()
              : (Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.aBeeZee(
                          color: Color(0xffFFD346), fontSize: 18),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          radius: 26,
                          backgroundColor: Colors.grey[900],
                          middleText: "Do you want to save the Note?",
                          middleTextStyle: GoogleFonts.varelaRound(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          title: "",
                          cancel: FlatButton(
                            child: Text(
                              "DISCARD",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.white, fontSize: 15),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          confirm: RaisedButton(
                            onPressed: () {
                              controller.addNote(
                                  titlecontroller.text, bodycontroller.text);
                              Get.back();
                              Get.back();
                              Get.snackbar(
                                  "New Note ", "Your note has been saved.");
                            },
                            elevation: 10,
                            color: Color(0xffFFD346),
                            child: Text(
                              "SAVE",
                              style: GoogleFonts.aBeeZee(fontSize: 15),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ));
                    },
                  )))
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23),
        child: RaisedButton(
          onPressed: () {
            Get.defaultDialog(
                backgroundColor: Colors.grey[900],
                title: "",
                middleText: "Are you sure you want to delete?",
                middleTextStyle: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontSize: 20,
                ),
                cancel: FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "NO",
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 15),
                    )),
                confirm: RaisedButton(
                  onPressed: () {
                    controller.notes.remove(NoteModel(
                        title: titlecontroller.text,
                        body: bodycontroller.text,
                        date: DateFormat('dd/MM/yyyy')
                            .format(DateTime.now())
                            .toString()));
                    Get.back();
                    Get.back();
                  },
                  child: Text(
                    "YES",
                    style: GoogleFonts.aBeeZee(fontSize: 15),
                  ),
                  elevation: 10,
                  color: Color(0xffFFD346),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ));
          },
          color: Color(0xff626262),
          elevation: 15,
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.delete_outline,
              size: 37,
              color: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
