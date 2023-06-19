import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/db_table.dart';
import 'package:lms_fiverr/models/subject.model.dart';
import 'package:lms_fiverr/models/teacher.model.dart';
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
      Subject(
              name: 'Maths',
              imageUrl:
                  'https://images.unsplash.com/photo-1509228468518-180dd4864904?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject(
              name: 'Physics',
              imageUrl:
                  'https://images.unsplash.com/photo-1636466497217-26a8cbeaf0aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject(
              name: 'English',
              imageUrl:
                  'https://images.unsplash.com/photo-1543109740-4bdb38fda756?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZW5nbGlzaHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60')
          .toMap());

  await db.insert(
      DBTable.SUBJECT_TABLE,
      Subject(
              name: 'French',
              imageUrl:
                  'https://media.istockphoto.com/id/629455902/photo/french-boulangerie-fresh-croissant-for-sale.webp?b=1&s=170667a&w=0&k=20&c=b3EwSILCdQpRdf5U4fe89-kpjJkK72gJjwscskW1T-w=')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Rossi',
              subjectId: 1,
              imageUrl:
                  'https://images.unsplash.com/photo-1601655781320-205e34c94eb1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Clark',
              subjectId: 1,
              imageUrl:
                  'https://images.unsplash.com/photo-1534308143481-c55f00be8bd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1630&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Varun',
              subjectId: 2,
              imageUrl:
                  'https://images.unsplash.com/photo-1574281570877-bd815ebb50a4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Derek',
              subjectId: 2,
              imageUrl:
                  'https://images.unsplash.com/photo-1630332458166-1c3bdde17665?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Sasha',
              subjectId: 3,
              imageUrl:
                  'https://plus.unsplash.com/premium_photo-1663011483768-2cd153a2d07a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Lana',
              subjectId: 3,
              imageUrl:
                  'https://images.unsplash.com/photo-1607990283143-e81e7a2c9349?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1441&q=80')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Gal',
              subjectId: 4,
              imageUrl:
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmVzc29yJTIwZmVtYWxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60')
          .toMap());

  await db.insert(
      DBTable.TEACHER_TABLE,
      Teacher(
              name: 'Prof. Anthony',
              subjectId: 4,
              imageUrl:
                  'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=934&q=80')
          .toMap());

  await db.insert(DBTable.STUDENT_TABLE,
      Student(name: 'Ana', username: 'ana_untescu', password: 'ana').toMap());
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentId = ref.watch(studentProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: studentId == null ? const Login() : const Home(),
    );
  }
}
