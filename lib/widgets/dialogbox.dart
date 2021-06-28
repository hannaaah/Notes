import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/themes/themes.dart';

class Dialogbox {
  final middletext;
  final canceltext;
  final confirmtext;
  final Function onconfirm;

  Dialogbox(
      {this.onconfirm, this.canceltext, this.confirmtext, this.middletext});

  dialogBox() {
    return Get.defaultDialog(
        backgroundColor: Themes.bgColor,
        title: "",
        middleText: middletext,
        middleTextStyle: GoogleFonts.varelaRound(
          color: Colors.white,
          fontSize: 20,
        ),
        cancel: TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: Text(
              canceltext,
              style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 15),
            )),
        confirm: RaisedButton(
          onPressed: onconfirm,
          child: Text(
            confirmtext,
            style: GoogleFonts.aBeeZee(fontSize: 15),
          ),
          elevation: 10,
          color: Themes.noteCardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ));
  }
}
