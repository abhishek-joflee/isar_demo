import 'package:flutter/material.dart';
import 'package:isar_demo/view/create_routine.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Routine',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateRoutinePage(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: const Text("hi"),
    );
  }
}
