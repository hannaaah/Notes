import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/widgets/notecards.dart';
import '../widgets/icon.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Notes",
              style: GoogleFonts.varelaRound(fontSize: 23),
            ),
          ),
          backgroundColor: Color(0xff222122),
        ),
        backgroundColor: Color(0xff222122),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: NoteCards(),
        ),
        floatingActionButton: IconWidget(
            icon: Icons.add_rounded,
            onpressed: () {
              Get.toNamed("Newnote");
            }));
  }
}
