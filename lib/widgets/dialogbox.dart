import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Dialogbox {
  final middletext;
  final canceltext;
  final confirmtext;
  final Function onconfirm;

  Dialogbox(
      {this.onconfirm, this.canceltext, this.confirmtext, this.middletext});

  dialogBox() {
    return Get.defaultDialog(
        backgroundColor: Color(0xff222122),
        title: "",
        middleText: middletext,
        middleTextStyle: GoogleFonts.varelaRound(
          color: Colors.white,
          fontSize: 20,
        ),
        cancel: TextButton(
            onPressed: () {
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
          color: Color(0xffFFD346),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ));
  }
}
