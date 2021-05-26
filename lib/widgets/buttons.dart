import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dialogbox.dart';

class Buttons extends StatelessWidget {
  final canceltext;
  final confirmtext;
  final middletext;
  final Function onconfirm;
  final buttontext;

  const Buttons(
      {this.canceltext,
      this.confirmtext,
      this.onconfirm,
      this.buttontext,
      this.middletext});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.8,
              offset: Offset(2.9, 2.9),
              color: Color(0xff313132))
          //   color: Color(0xffFFD338))
        ],
        // color: Colors.black.withOpacity(0.2),
      ),
      // color: Color(0xff313132)),
      height: 50,
      width: 120,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: CircleBorder(),
        color: Colors.grey[600],
        onPressed: () {
          final dia = Dialogbox(
              canceltext: canceltext,
              confirmtext: confirmtext,
              middletext: middletext,
              onconfirm: onconfirm);
          dia.dialogBox();
        },
        child: Text(
          buttontext,
          style:
              GoogleFonts.varelaRound(color: Color(0xffFFD338), fontSize: 17),
        ),
      ),
    );
  }
}
