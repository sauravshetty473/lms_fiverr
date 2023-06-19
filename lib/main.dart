import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/db_table.dart';
import 'package:lms_fiverr/models/subject.model.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/services/database.dart';
import 'package:lms_fiverr/ui/home.dart';
import 'package:lms_fiverr/ui/login.dart';

import 'models/student.model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await populateDatabase();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future populateDatabase() async {
  final db = Database();
  await db.deleteDatabaseCustom();

  await db.insert(
      DBTable.STUDENT_TABLE,
      Student(name: 'Saurav', username: 'saurav.vs', password: 'admin')
          .toMap());

  await db.insert(DBTable.STUDENT_TABLE,
      Student(name: 'Ana', username: 'ana_untescu', password: 'ana').toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject( name: 'Maths', imageUrl: 'https://images.unsplash.com/photo-1509228468518-180dd4864904?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject( name: 'Physics', imageUrl: 'https://images.unsplash.com/photo-1636466497217-26a8cbeaf0aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject( name: 'English', imageUrl: 'https://images.unsplash.com/photo-1543109740-4bdb38fda756?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZW5nbGlzaHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject( name: 'French', imageUrl: 'https://media.istockphoto.com/id/629455902/photo/french-boulangerie-fresh-croissant-for-sale.webp?b=1&s=170667a&w=0&k=20&c=b3EwSILCdQpRdf5U4fe89-kpjJkK72gJjwscskW1T-w=')
          .toMap());

  await db.insert(DBTable.STUDENT_TABLE,
      Student(name: 'Ana', username: 'ana_untescu', password: 'ana').toMap());
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentId = ref.watch(studentIDProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: studentId == null ? const Login() : const Home(),
    );
  }
}
