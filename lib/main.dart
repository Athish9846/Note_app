import 'package:flutter/material.dart';
import 'package:notes_master/data_base/db.dart';
import 'package:notes_master/screens/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Homepage(),
    );
  }
}