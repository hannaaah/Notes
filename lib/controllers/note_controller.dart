import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../model/notemodel.dart';

class NoteController extends GetxController {
  Box<dynamic> notes = Hive.box("Notes");
  void addNote(String title, String body) {
    notes.add(NoteModel(
        title: title == "" ? "No title" : title,
        body: body,
        date: DateFormat('MMM dd, yyyy').format(DateTime.now()).toString()));
  }

  void delNote(int index) {
    notes.deleteAt(index);
  }
}
