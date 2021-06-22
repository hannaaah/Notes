import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../model/notemodel.dart';

class NoteController extends GetxController {
  Box<dynamic> notes = Hive.box("Notes");

  NoteModel getNote(int index) {
    return notes.getAt(index);
  }

  void addNote(String title, String body) {
    final newNote = NoteModel(
        title: title,
        body: body,
        date: DateFormat('dd MMM, yyyy').format(DateTime.now()).toString());
    if (notes.length != 0) {
      notes.add(notes.getAt(notes.length - 1));
      for (int i = notes.length - 1; i > 0; i--) {
        notes.putAt(i, notes.getAt(i - 1));
      }
      notes.putAt(0, newNote);
    } else
      notes.add(newNote);
  }

  void delNote(int index) {
    notes.deleteAt(index);
  }
}
