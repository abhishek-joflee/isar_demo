import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_demo/models/category.dart';
import 'package:isar_demo/models/routine.dart';
import 'package:isar_demo/view/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await Isar.open(
    [
      RoutineSchema,
      CategorySchema,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainPage(),
    );
  }
}
