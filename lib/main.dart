import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/model/notemodel.dart';
import 'package:notes/views/home.dart';
import 'package:notes/views/new_note.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox("Notes");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: "/", page: () => MyApp()),
          GetPage(name: "Newnote", page: () => NewNote())
        ],
        home: Home());
  }
}
