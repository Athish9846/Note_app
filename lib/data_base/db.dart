
import 'package:flutter/material.dart';
import 'package:notes_master/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Notes>> notesListNotifier =ValueNotifier([]);

late Database db;

Future<void>initializeDataBase()async {
db=await openDatabase(
  'notes_db',
  version: 1,
  onCreate: (Database db, int version)async{
 await db.execute('CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, createdAt DATETIME, updatedAt DATETIME)');
}
);
}

Future<void>addNotes(Notes value)async{
  //  String createdAtString = value.createdAt!.toIso8601String();
  // String updatedAtString = value.updatedAt?.toIso8601String() ?? createdAtString;

  await db.rawInsert('INSERT INTO notes(title, content, createdAt, updatedAt) VALUES (?, ?, ?, ?)',
  [value.title,value.content,value.createdAt!.toIso8601String(),value.updatedAt!.toIso8601String()]);
  notesListNotifier.value.add(value);
  await getNotes();
  notesListNotifier.notifyListeners();
  print(value.title);
}


Future<void>getNotes()async{
final values= await db.rawQuery('SELECT * FROM notes');
notesListNotifier.value.clear();

values.forEach((map) {
  final notes=Notes.fromMap(map);
  notesListNotifier.value.add(notes);
 
});
 notesListNotifier.notifyListeners();
}