import 'package:flutter/material.dart';
import 'package:lms_fiverr/constants/db_table.dart';
import 'package:lms_fiverr/services/database.dart';
import 'package:lms_fiverr/ui/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await populateDatabase();
  runApp(const MyApp());
}

Future populateDatabase() async {
  final db = Database();
  await db.deleteDatabaseCustom();

  await db.insert(
      DBTable.STUDENT_TABLE,
      Student(id: 1, name: 'Saurav', username: 'saurav.vs', password: 'admin')
          .toMap());



  print(await db.getTableNames());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: const Login(),
    );
  }
}
