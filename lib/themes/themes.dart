import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static TextStyle headingStyle = GoogleFonts.varelaRound(fontSize: 20);
  static TextStyle noNoteStyle =
      GoogleFonts.varelaRound(color: Colors.grey[700]);
  static TextStyle titleStyle = GoogleFonts.varelaRound(fontSize: 25);
  static TextStyle bodyStyle = GoogleFonts.varelaRound(fontSize: 15);
  static TextStyle dateStyle = GoogleFonts.nunito(
    color: Colors.black54,
    fontSize: 12,
  );
  static TextStyle editBodyStyle =
      GoogleFonts.varelaRound(wordSpacing: 4, fontSize: 17);
  static Color bgColor = Color(0xff161616);
  static Color noteCardColor = Color(0xffd19498);
}
