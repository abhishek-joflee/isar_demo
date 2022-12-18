import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_demo/models/category.dart';
import 'package:isar_demo/models/routine.dart';
import 'package:isar_demo/shared/isar_singleton.dart';
import 'package:isar_demo/view/main_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [
      RoutineSchema,
      CategorySchema,
    ],
    directory: dir.path,
    inspector: true,
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
