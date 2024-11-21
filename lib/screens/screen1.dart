import 'package:flutter/material.dart';
import 'package:notes_master/data_base/db.dart';
import 'package:notes_master/model/note_model.dart';

class Screen1 extends StatelessWidget {
  Screen1({super.key});
  int maxlinelimit = 44;
  final titlecontroller = TextEditingController();
  final notecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(titlecontroller.text);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                notesave();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titlecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Title'),
              ),
              TextField(
                controller: notecontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Notes'),
              )
            ],
          ),
        )),
      ),
    );
  }

  void notesave() async {
    DateTime createdtime = DateTime.now();
    Notes save = Notes(
        title: titlecontroller.text,
        content: notecontroller.text,
        createdAt: createdtime);
    await addNotes(save);
  }
}
