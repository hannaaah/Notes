import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'note_model.dart';

class NoteController extends GetxController {
  List<NoteModel> notes = [
    NoteModel(
        title: "Title",
        body: "This is the description",
        date: DateFormat('dd/MM/yyyy').format(DateTime.now()))
  ].obs;

  void addNote(String title, String body) {
    notes.insert(
        0,
        NoteModel(
            title: title == "" ? "No title" : title,
            body: body,
            date: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()));
  }

  void delNote(int index) {
    notes.removeAt(index);
  }
}
