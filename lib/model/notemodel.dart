import 'package:hive/hive.dart';
part 'notemodel.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String body;
  @HiveField(2)
  String date;
  NoteModel({this.title, this.body, this.date});
}
