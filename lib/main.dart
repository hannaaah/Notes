import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/widgets/icon.dart';
import 'package:notes/new_note.dart';
import 'note_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(NoteController());
  final newNoteController = Get.put(NewNote());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/", page: () => MyApp()),
          GetPage(name: "Newnote", page: () => NewNote())
        ],
        home: Scaffold(
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
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 127,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                "Newnote?title=${controller.notes[index].title}&body=${controller.notes[index].body}&index=$index");
                          },
                          child: Card(
                            color: Color(0xffFFCB35),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(13, 13, 13, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.notes[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.varelaRound(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.notes[index].body,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.manjari(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    controller.notes[index].date,
                                    style: GoogleFonts.khula(
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            floatingActionButton: IconWidget(
                icon: Icons.add_rounded,
                onpressed: () {
                  Get.toNamed("Newnote");
                })));
  }
}
